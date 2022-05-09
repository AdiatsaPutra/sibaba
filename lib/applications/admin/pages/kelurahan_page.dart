import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/kapanewon/kapanewon_cubit.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:sibaba/applications/admin/widgets/kelurahan/add_kelurahan_dialog.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/add_kelurahan/add_kelurahan_cubit.dart';
import '../bloc/kelurahan/kelurahan_cubit.dart';
import '../models/kelurahan.dart';

class KelurahanPage extends StatelessWidget {
  const KelurahanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<KelurahanCubit>()..getKelurahan(),
        ),
        BlocProvider(
          create: (context) => getIt<KapanewonCubit>()..getKapanewon(),
        ),
        BlocProvider(
          create: (context) => getIt<AddKelurahanCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: 'Data Kelurahan'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<KapanewonCubit, KapanewonState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
            loaded: (kapanewon) => BlocConsumer<KelurahanCubit, KelurahanState>(
              listener: (context, state) => state.maybeWhen(
                deleted: () {
                  Get.back();
                  context.read<KelurahanCubit>().getKelurahan();
                },
                orElse: () {},
              ),
              builder: (context, state) => state.maybeWhen(
                loading: () => const CircularProgressIndicator().centered(),
                loaded: (kelurahan) => _KapanewonLayout(
                  kelurahan: kelurahan,
                  kapanewon: kapanewon,
                ),
                orElse: () => const SizedBox(),
              ),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class _KapanewonLayout extends StatelessWidget {
  final List<Kelurahan> kelurahan;
  final List<Kapanewon> kapanewon;

  const _KapanewonLayout(
      {Key? key, required this.kelurahan, required this.kapanewon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KelurahanCubit>();
    final addKelurahanCubit = context.read<AddKelurahanCubit>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<KapanewonCubit>().getKapanewon();
        },
        child: VStack(
          [
            TextFormField(
              controller: cubit.searchKeyword,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari Kelurahan (Nama, Kode Area)',
                hintStyle: TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                cubit.searchKelurahan();
              },
            ),
            const SizedBox(height: 10),
            PaginatedDataTable(
              source: KapanewonData(
                  context, kelurahan, cubit, kapanewon, addKelurahanCubit),
              header: 'Data Kelurahan'.text.xl.make(),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Kelurahan')),
                DataColumn(label: Text('Kapanewon')),
                DataColumn(label: Text('Action')),
              ],
              columnSpacing: 50,
              horizontalMargin: 20,
              // rowsPerPage: 5,
              showCheckboxColumn: false,
            ),
            const SizedBox(height: 100),
          ],
        ).centered().p16().scrollVertical(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          VxDialog.showCustom(
            context,
            child: AddKelurahanDialog(
              index: 0,
              kelurahan: cubit,
              cubit: addKelurahanCubit,
              kapanewon: kapanewon,
              kelurahanList: kelurahan,
            ),
          );
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Kelurahan'.text.base.make(),
        ]),
      ),
    );
  }
}

class KapanewonData extends DataTableSource {
  final BuildContext context;
  final List<Kelurahan> kelurahan;
  final List<Kapanewon> kapanewon;
  final KelurahanCubit cubit;
  final AddKelurahanCubit addKelurahanCubit;
  String role = '';

  KapanewonData(this.context, this.kelurahan, this.cubit, this.kapanewon,
      this.addKelurahanCubit);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => kelurahan.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell((index + 1).toString().text.isIntrinsic.make()),
      DataCell(kelurahan[index].districtName.text.isIntrinsic.make()),
      DataCell(kapanewon
          .where((element) => element.areaId == kelurahan[index].areaId)
          .map((e) => e.areaName)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '')
          .text
          .isIntrinsic
          .make()),
      DataCell(
        HStack([
          GestureDetector(
            onTap: () {
              addKelurahanCubit.init(kelurahan[index]);
              VxDialog.showCustom(
                context,
                child: AddKelurahanDialog(
                  index: index,
                  kelurahanId: kelurahan[index].districtId,
                  kapanewonId: kapanewon[kelurahan[index].areaId].areaId,
                  kelurahan: cubit,
                  cubit: addKelurahanCubit,
                  kapanewon: kapanewon,
                  kelurahanList: kelurahan,
                ),
              );
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
              PopupMessages.confirmDeletePopup(context, () {
                cubit.deleteKelurahan(kelurahan[index].districtId);
              });
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
