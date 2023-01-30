import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/santri.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/add_santri_page.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../presentation/popup_messages.dart';
import '../bloc/santri/santri_cubit.dart';

class DataSantriPage extends StatelessWidget {
  final User user;
  const DataSantriPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Data Santri'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => getIt<SantriCubit>()..getSantri(),
        child: _DatSantriLayout(user: user),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => AddSantriPage(user: user));
        },
        label: HStack([
          const Icon(Icons.add),
          'Unggah Data Santri'.text.base.make(),
        ]),
      ),
    );
  }
}

class _DatSantriLayout extends StatelessWidget {
  const _DatSantriLayout({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SantriCubit>();
    return BlocListener<RefreshCubit, RefreshState>(
      listener: (context, state) => state.maybeWhen(
        santriAdded: () {
          cubit.getSantri();
          PopupMessages.successPopup('Satri Ditambahkan');
          return null;
        },
        orElse: () {
          return null;
        },
      ),
      child: VStack([
        TextFormField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
          onChanged: (value) {
            cubit.search(value);
          },
        ),
        const SizedBox(height: 10),
        BlocConsumer<SantriCubit, SantriState>(
          listener: (context, state) => state.maybeWhen(
            deleted: () {
              Navigator.pop(context);
              cubit.getSantri();
              return null;
            },
            orElse: () {
              return null;
            },
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
            error: (message) => message.text.make(),
            success: (s) => VStack(
              [
                PaginatedDataTable(
                  source: MyData(context, s, user, cubit),
                  header: 'Data Santri'.text.xl.make(),
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Aksi')),
                    DataColumn(label: Text('Wilayah')),
                    DataColumn(label: Text('Unit')),
                    DataColumn(label: Text('Tahun Ajaran')),
                    DataColumn(label: Text('File')),
                  ],
                  columnSpacing: 20,
                  horizontalMargin: 10,
                  rowsPerPage: s.length > 5 ? 5 : s.length,
                  showCheckboxColumn: false,
                ),
              ],
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ]),
    ).centered().p16().scrollVertical();
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<Santri> santri;
  final User user;
  final SantriCubit cubit;

  MyData(
    this.context,
    this.santri,
    this.user,
    this.cubit,
  );

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => santri.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Row(
        children: [
          HStack([
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddSantriPage(
                      user: user,
                      santri: santri[index],
                    ),
                  ),
                );
              },
              child: const Icon(Icons.edit, color: Colors.yellow),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                PopupMessages.confirmDeletePopup(context, () {
                  cubit.deleteSantri(santri[index].id);
                });
              },
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                cubit.downloadSantri(santri[index].id);
              },
              child: const Icon(Icons.download, color: Colors.indigo),
            ),
          ]),
        ],
      )),
      DataCell(Text(santri[index].wilayah)),
      DataCell(Text(santri[index].unit)),
      DataCell(Text(santri[index].tahunAjaran)),
      DataCell(Text(santri[index].file)),
    ]);
  }
}
