import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sibaba/applications/admin/models/ustadz.dart';
import 'package:sibaba/applications/admin/pages/detail_data_ustadz_page.dart';
import 'package:sibaba/applications/admin/pages/ustadz/add_ustadz_page.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../infrastructures/refresh/cubit/refresh_cubit.dart';
import '../../../presentation/popup_messages.dart';
import '../../info_lokasi/model/location.dart';
import '../bloc/kapanewon/kapanewon_cubit.dart';
import '../bloc/ustadz/ustadz_cubit.dart';

class DataUstadzPage extends StatelessWidget {
  const DataUstadzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Data Ustadz'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<UstadzCubit>()..getUstadzs(),
          ),
          BlocProvider(
            create: (context) => getIt<KapanewonCubit>()..getKapanewon(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<RefreshCubit, RefreshState>(
              listener: (context, state) => state.maybeWhen(
                ustadzAdded: () {
                  context.read<UstadzCubit>().getUstadzs();
                  PopupMessages.successPopup('Berhasil menambahkan ustadz');
                },
                orElse: () {},
              ),
            ),
            BlocListener<UstadzCubit, UstadzState>(
              listener: (context, state) => state.maybeWhen(
                success: () {
                  Navigator.pop(context);
                  context.read<UstadzCubit>().getUstadzs();
                  PopupMessages.successPopup('Berhasil menghapus ustadz');
                },
                orElse: () {},
              ),
            ),
          ],
          child: BlocBuilder<UstadzCubit, UstadzState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircularProgressIndicator().centered(),
              loaded: (u) => _DataUstadzLayout(u: u),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => const AddUstadzPage());
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Data Ustadz'.text.base.make(),
        ]),
      ),
    );
  }
}

class _DataUstadzLayout extends StatelessWidget {
  final List<Ustadz> u;

  const _DataUstadzLayout({Key? key, required this.u}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UstadzCubit>();
    return VStack(
      [
        TextFormField(
          controller: cubit.searchKeyword,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
          onChanged: (value) {
            cubit.searchInfoLokasi();
          },
        ),
        const SizedBox(height: 10),
        BlocBuilder<UstadzCubit, UstadzState>(
          builder: (context, state) {
            return BlocBuilder<KapanewonCubit, KapanewonState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => DropdownButtonFormField<String>(
                  hint: 'Loading'.text.lg.make(),
                  items: const [],
                  onChanged: (e) {},
                ).box.width(Get.width).make().pOnly(bottom: 10),
                loaded: (kapanewon) => HStack([
                  DropdownButtonFormField<String>(
                    value: cubit.kapanewon == '' ? null : cubit.kapanewon,
                    hint: 'Pilih Kapanewon'.text.lg.make(),
                    items: [
                      ...kapanewon.map((e) {
                        return DropdownMenuItem<String>(
                          value: e.areaName,
                          child: e.areaName.text.lg.make(),
                        );
                      }),
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih Kapanewon';
                      }
                    },
                    onChanged: (e) {
                      cubit.filterInfoLokasi(e!);
                    },
                  ).box.width(Get.width / 1.5).make().pOnly(bottom: 10),
                  const SizedBox().expand(),
                  Builder(
                    builder: (context) => cubit.kapanewon == ''
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              cubit.refresh();
                              cubit.getUstadzs();
                            },
                            child: 'Clear'.text.sm.color(primaryColor).make(),
                          ),
                  )
                ]),
                orElse: () => const SizedBox(),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        HStack([
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              _createPDF(cubit.ustadz);
            },
            child: 'Cetak'.text.base.make(),
          ).w(100).h(30),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              saveExcel(cubit.ustadz);
            },
            child: 'Excel'.text.base.make(),
          ).w(100).h(30),
        ]),
        const SizedBox(height: 10),
        u.isEmpty
            ? 'Tidak ada data ustadz'.text.base.makeCentered()
            : PaginatedDataTable(
                source: UstadzData(cubit.ustadz, context, cubit),
                header: 'Data Ustadz'.text.xl.make(),
                columns: const [
                  DataColumn(label: Text('No')),
                  DataColumn(label: Text('Aksi')),
                  DataColumn(label: Text('No Induk')),
                  DataColumn(label: Text('Unit')),
                  DataColumn(label: Text('Kapanewon')),
                  DataColumn(label: Text('Nama')),
                  DataColumn(label: Text('Alamat'))
                ],
                columnSpacing: 50,
                horizontalMargin: 10,
                rowsPerPage: u.isEmpty
                    ? 1
                    : u.length <= 10 && u.isNotEmpty
                        ? u.length
                        : 10,
                showCheckboxColumn: false,
              ),
        const SizedBox(height: 100),
      ],
    ).centered().p16().scrollVertical();
  }

  Future<void> _createPDF(List<Ustadz> ustadz) async {
    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 4);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'No Induk';
    header.cells[2].value = 'Kapanewon';
    header.cells[1].value = 'Nama';
    header.cells[3].value = 'Alamat';

    PdfGridRow row;
    for (int i = 0; i < ustadz.length; i++) {
      row = grid.rows.add();
      row.cells[0].value = ustadz[i].ustadzsId.toString();
      row.cells[1].value = ustadz[i].location.areaUnit;
      row.cells[2].value = ustadz[i].nama;
      row.cells[3].value = ustadz[i].alamat;
    }

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }

  Future<void> saveExcel(List<Ustadz> ustadz) async {
    final Workbook workbook = Workbook(1);

    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A1:D1').setText('Data Ustadz TKA-TPA Badko Bantul');
    sheet.getRangeByName('A1:D1').merge();
    sheet.getRangeByName('A2').setText('No Induk');
    sheet.getRangeByName('B2').setText('Kapanewon');
    sheet.getRangeByName('C2').setText('Nama');
    sheet.getRangeByName('D2').setText('Alamat');
    sheet
        .getRangeByName('A${ustadz.length + 3}:E${ustadz.length + 3}')
        .setText('*Ustadz yang sudah terdaftar di Badko Bantul*');
    sheet.getRangeByName('A${ustadz.length + 3}:E${ustadz.length + 3}').merge();

    for (int i = 0; i < ustadz.length; i++) {
      sheet.getRangeByName('A${i + 3}').setText(ustadz[i].ustadzsId.toString());
      sheet.getRangeByName('A${i + 3}').columnWidth = 15;
      sheet.getRangeByName('B${i + 3}').setText(ustadz[i].location.areaUnit);
      sheet.getRangeByName('B${i + 3}').columnWidth = 10;
      sheet.getRangeByName('C${i + 3}').setText(ustadz[i].nama);
      sheet.getRangeByName('C${i + 3}').columnWidth = 20;
      sheet.getRangeByName('D${i + 3}').setText(ustadz[i].alamat);
      sheet.getRangeByName('D${i + 3}').columnWidth = 50;
    }

    final Style headingStyle = workbook.styles.add('HeadingStyle');
    headingStyle.bold = true;
    headingStyle.hAlign = HAlignType.center;
    headingStyle.wrapText = true;
    sheet.getRangeByName('A1:D1').cellStyle = headingStyle;
    sheet.getRangeByName('A2:D2').cellStyle = headingStyle;
    sheet
        .getRangeByName('A${ustadz.length + 3}:D${ustadz.length + 3}')
        .cellStyle = headingStyle;

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/Output.xlsx');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/Output.xlsx');
  }
}

class UstadzData extends DataTableSource {
  final BuildContext context;
  final List<Ustadz> u;
  final UstadzCubit cubit;

  UstadzData(this.u, this.context, this.cubit);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => u.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (bool? selected) {
          if (selected!) {
            Get.to(() => DetailDataUstadzPage(ustadzId: u[index].ustadzsId));
          }
        },
        cells: [
          DataCell(Text('${index + 1}'.toString())),
          DataCell(
            HStack([
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.edit, color: Colors.yellow),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  PopupMessages.confirmDeletePopup(context, () {
                    cubit.deleteUstadz(u[index].ustadzsId);
                  });
                },
                child: const Icon(Icons.delete, color: Colors.red),
              ),
            ]),
          ),
          DataCell(Text(u[index].ustadzsId.toString())),
          DataCell(Text(u[index].location.nama)),
          DataCell(Text(u[index].location.districtUnit)),
          DataCell(Text(u[index].nama)),
          DataCell(Text(u[index].alamat)),
        ]);
  }
}
