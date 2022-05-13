import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sibaba/applications/admin/bloc/location/location_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/lokasi/add_lokasi_page.dart';
import 'package:sibaba/applications/admin/pages/lokasi/detail_lokasi_page.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/kapanewon/kapanewon_cubit.dart';

class LokasiUnitPage extends StatelessWidget {
  final User user;
  const LokasiUnitPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<InfoLokasiCubit>()..getLokasi(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<KapanewonCubit>()..getKapanewon(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: 'Data Lokasi'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: MultiBlocListener(
          listeners: [
            BlocListener<RefreshCubit, RefreshState>(
              listener: (context, state) => state.maybeWhen(
                locationAdded: () {
                  context.read<InfoLokasiCubit>().getLokasi();
                },
                orElse: () {},
              ),
            ),
            BlocListener<InfoLokasiCubit, InfoLokasiState>(
              listener: (context, state) => state.maybeWhen(
                detailLoaded: (detailLocation) {
                  Get.to(
                    () => AddLokasiPage(
                      isEdit: true,
                      user: user,
                      latLng: LatLng(0, 0),
                      locationDetail: detailLocation,
                    ),
                  );
                  context.read<InfoLokasiCubit>().getLokasi();
                },
                deleted: () {
                  context.read<InfoLokasiCubit>().getLokasi();
                },
                orElse: () {},
              ),
            ),
          ],
          child: BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const LoadingIndicator(isScrollable: true),
              loaded: (locations) =>
                  _LokasiLayout(locations: locations.lokasi, user: user),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}

class _LokasiLayout extends StatelessWidget {
  final List<Lokasi> locations;
  final User user;

  const _LokasiLayout({Key? key, required this.locations, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InfoLokasiCubit>();
    final map = context.read<LocationCubit>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<InfoLokasiCubit>().getLokasi();
        },
        child: VStack(
          [
            TextFormField(
              controller: cubit.searchKeyword,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari Lokasi',
                hintStyle: TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                cubit.searchInfoLokasi();
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
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
                                  cubit.getLokasi();
                                },
                                child:
                                    'Clear'.text.sm.color(primaryColor).make(),
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
                  _createPDF(locations);
                },
                child: 'Cetak'.text.base.make(),
              ).w(100).h(30),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  saveExcel(locations);
                },
                child: 'Excel'.text.base.make(),
              ).w(100).h(30),
            ]),
            const SizedBox(height: 10),
            cubit.locationList.isEmpty
                ? 'Tidak ada lokasi'.text.base.makeCentered()
                : PaginatedDataTable(
                    source:
                        LokasiData(context, cubit.locationList, cubit, user),
                    header: 'Data Lokasi'.text.xl.make(),
                    columns: const [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Action')),
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Kapanewon')),
                      DataColumn(label: Text('Direktur')),
                      DataColumn(label: Text('Alamat')),
                    ],
                    columnSpacing: 50,
                    horizontalMargin: 20,
                    rowsPerPage: cubit.locationList.length <= 10
                        ? cubit.locationList.length
                        : 10,
                    showCheckboxColumn: false,
                  ),
            const SizedBox(height: 100),
          ],
        ).centered().p16().scrollVertical(),
      ),
      floatingActionButton: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) => state.maybeWhen(
          success: () => Get.to(
            () => AddLokasiPage(
              isEdit: false,
              user: user,
              latLng: LatLng(map.lat, map.long),
            ),
          ),
          orElse: () {},
        ),
        child: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {
            map.getLocation();
          },
          label: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircularProgressIndicator().centered(),
              orElse: () => HStack([
                const Icon(Icons.add),
                'Tambah Lokasi'.text.base.make(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createPDF(List<Lokasi> locations) async {
    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 5);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'No Induk';
    header.cells[1].value = 'Nama';
    header.cells[2].value = 'Kapanewon';
    header.cells[3].value = 'Direktur';
    header.cells[4].value = 'Alamat';

    PdfGridRow row;
    for (int i = 0; i < locations.length; i++) {
      row = grid.rows.add();
      row.cells[0].value = locations[i].locationId.toString();
      row.cells[1].value = locations[i].nama;
      row.cells[2].value = locations[i].areaUnit;
      row.cells[3].value = locations[i].direktur;
      row.cells[4].value = locations[i].alamat;
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

  Future<void> saveExcel(List<Lokasi> lokasi) async {
    final Workbook workbook = Workbook(1);

    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A1:E1').setText('Data Lokasi TKA-TPA Badko Bantul');
    sheet.getRangeByName('A1:E1').merge();
    sheet.getRangeByName('A2').setText('No Induk');
    sheet.getRangeByName('B2').setText('Nama');
    sheet.getRangeByName('C2').setText('Kapanewon');
    sheet.getRangeByName('D2').setText('Direktur');
    sheet.getRangeByName('E2').setText('Alamat');
    sheet
        .getRangeByName('A${locations.length + 3}:E${locations.length + 3}')
        .setText('*Lokasi yang sudah terdaftar di Badko Bantul*');
    sheet
        .getRangeByName('A${locations.length + 3}:E${locations.length + 3}')
        .merge();

    for (int i = 0; i < locations.length; i++) {
      sheet
          .getRangeByName('A${i + 3}')
          .setText(locations[i].locationId.toString());
      sheet.getRangeByName('A${i + 3}').columnWidth = 15;
      sheet.getRangeByName('B${i + 3}').setText(locations[i].nama);
      sheet.getRangeByName('B${i + 3}').columnWidth = 20;
      sheet.getRangeByName('C${i + 3}').setText(locations[i].areaUnit);
      sheet.getRangeByName('C${i + 3}').columnWidth = 10;
      sheet.getRangeByName('D${i + 3}').setText(locations[i].direktur);
      sheet.getRangeByName('D${i + 3}').columnWidth = 20;
      sheet.getRangeByName('E${i + 3}').setText(locations[i].alamat);
      sheet.getRangeByName('E${i + 3}').columnWidth = 50;
    }

    final Style headingStyle = workbook.styles.add('HeadingStyle');
    headingStyle.bold = true;
    headingStyle.hAlign = HAlignType.center;
    headingStyle.wrapText = true;
    sheet.getRangeByName('A1:E1').cellStyle = headingStyle;
    sheet.getRangeByName('A2:E2').cellStyle = headingStyle;
    sheet
        .getRangeByName('A${locations.length + 3}:E${locations.length + 3}')
        .cellStyle = headingStyle;

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/Output.xlsx');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/Output.xlsx');
  }
}

class LokasiData extends DataTableSource {
  final BuildContext context;
  final List<Lokasi> locations;
  final InfoLokasiCubit cubit;
  String role = '';
  final User user;

  LokasiData(this.context, this.locations, this.cubit, this.user);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => locations.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (bool? selected) {
          if (selected!) {
            Get.to(
              () => DetailLokasiPage(
                slug: locations[index].locSlug!,
              ),
            );
          }
        },
        cells: [
          DataCell((index + 1).toString().text.isIntrinsic.make()),
          DataCell(
            HStack([
              GestureDetector(
                onTap: () {
                  cubit.getLocationDetail(locations[index].locSlug!);
                },
                child: const Icon(Icons.edit, color: Colors.yellow),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  PopupMessages.confirmDeletePopup(context, () {
                    Navigator.pop(context);
                    context
                        .read<InfoLokasiCubit>()
                        .deleteLokasi(locations[index].locationId!);
                  });
                },
                child: const Icon(Icons.delete, color: Colors.red),
              ),
            ]),
          ),
          DataCell(
              locations[index].locationId.toString().text.isIntrinsic.make()),
          DataCell(locations[index].nama!.text.isIntrinsic.make()),
          DataCell(locations[index].areaUnit!.text.isIntrinsic.make()),
          DataCell(locations[index].direktur!.text.isIntrinsic.make()),
          DataCell(locations[index].alamat!.text.isIntrinsic.make()),
        ]);
  }
}
