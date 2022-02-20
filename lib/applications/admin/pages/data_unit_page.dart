import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/pages/lokasi/add_lokasi_page.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/applications/info_lokasi/model/location.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

class LokasiUnitPage extends StatelessWidget {
  const LokasiUnitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InfoLokasiCubit>()..getLocations(),
      child: Scaffold(
        appBar: AppBar(
          title: 'Data Lokasi'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<InfoLokasiCubit, InfoLokasiState>(
          listener: (context, state) => state.maybeWhen(
            // added: () {
            //   context.read<InfoLokasiCubit>().getUsers();
            //   PopupMessages.successPopup('Data Lokasi Berhasil Ditambahkan');
            // },
            // deleted: () async {
            //   context.read<InfoLokasiCubit>().getUsers();
            //   PopupMessages.successPopup('Data Lokasi Berhasil Dihapus');
            // },
            orElse: () {},
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => const LoadingIndicator(isScrollable: true),
            loaded: (locations) => _LokasiLayout(locations: locations),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class _LokasiLayout extends StatelessWidget {
  final List<Location> locations;

  const _LokasiLayout({Key? key, required this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InfoLokasiCubit>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<InfoLokasiCubit>().getLocations();
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
                // cubit.searchUser();
              },
            ),
            const SizedBox(height: 10),
            PaginatedDataTable(
              source: LokasiData(context, locations, cubit),
              header: 'Data Lokasi'.text.xl.make(),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Action')),
              ],
              columnSpacing: 50,
              horizontalMargin: 20,
              rowsPerPage: locations.length <= 10 ? locations.length : 10,
              showCheckboxColumn: false,
            ),
            const SizedBox(height: 100),
          ],
        ).centered().p16().scrollVertical(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => const AddLokasiPage(isEdit: false));
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Lokasi'.text.base.make(),
        ]),
      ),
    );
  }
}

class LokasiData extends DataTableSource {
  final BuildContext context;
  final List<Location> locations;
  final InfoLokasiCubit cubit;
  String role = '';

  LokasiData(this.context, this.locations, this.cubit);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => locations.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell((index + 1).toString().text.isIntrinsic.make()),
      DataCell(locations[index].locationId.toString().text.isIntrinsic.make()),
      DataCell(locations[index].nama!.text.isIntrinsic.make()),
      DataCell(locations[index].email!.text.isIntrinsic.make()),
      DataCell(
        HStack([
          GestureDetector(
            onTap: () {
              Get.to(() =>
                  AddLokasiPage(isEdit: true, slug: locations[index].locSlug!));
            },
            child: VxCapsule(
              width: 50,
              height: 20,
              backgroundColor: Colors.yellow,
              child: 'Edit'.text.sm.makeCentered(),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              PopupMessages.confirmDeletePopup(context, () {});
            },
            child: VxCapsule(
              width: 50,
              height: 20,
              backgroundColor: Colors.red,
              child: 'Delete'.text.sm.color(Colors.white).makeCentered(),
            ),
          ),
        ]),
      ),
    ]);
  }
}
