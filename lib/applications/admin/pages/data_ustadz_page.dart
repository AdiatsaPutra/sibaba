import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/ustadz.dart';
import 'package:sibaba/applications/admin/pages/detail_data_ustadz_page.dart';
import 'package:sibaba/applications/admin/pages/ustadz/add_ustadz_page.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../infrastructures/refresh/cubit/refresh_cubit.dart';
import '../../../presentation/popup_messages.dart';
import '../bloc/ustadz/ustadz_cubit.dart';

class DataUstadzPage extends StatelessWidget {
  const DataUstadzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Data Ustadz'),
      body: BlocProvider(
        create: (context) => getIt<UstadzCubit>()..getUstadzs(),
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
          controller: TextEditingController(),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
          onChanged: (value) {},
        ),
        const SizedBox(height: 10),
        PaginatedDataTable(
          source: UstadzData(u, context, cubit),
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
          rowsPerPage: u.length <= 10 ? u.length : 10,
          showCheckboxColumn: false,
        ),
        const SizedBox(height: 100),
      ],
    ).centered().p16().scrollVertical();
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
