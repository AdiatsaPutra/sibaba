import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
import 'package:velocity_x/velocity_x.dart';

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
                // cubit.searchUser();
              },
            ),
            const SizedBox(height: 10),
            PaginatedDataTable(
              source: LokasiData(context, locations, cubit, user),
              header: 'Data Lokasi'.text.xl.make(),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Action')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Email')),
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
                  Get.to(
                    () => AddLokasiPage(
                      isEdit: true,
                      user: user,
                      latLng: LatLng(0, 0),
                    ),
                  );
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
          DataCell(locations[index].email!.text.isIntrinsic.make()),
        ]);
  }
}
