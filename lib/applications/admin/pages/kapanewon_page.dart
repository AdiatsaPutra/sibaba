import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/kapanewon/kapanewon_cubit.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/widgets/kapanewon/add_kapanewon_dialog.dart';
import 'package:sibaba/applications/admin/widgets/kapanewon/edit_kapanewon_dialog.dart';
import 'package:sibaba/applications/admin/widgets/user/add_user_dialog.dart';
import 'package:sibaba/applications/admin/widgets/user/edit_user_dialog.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

class KapanewonPage extends StatelessWidget {
  const KapanewonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<KapanewonCubit>()..getKapanewon(),
      child: Scaffold(
        appBar: AppBar(
          title: 'Data Kapanewon'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<KapanewonCubit, KapanewonState>(
          listener: (context, state) => state.maybeWhen(
            added: () {
              context.read<KapanewonCubit>().getKapanewon();
              PopupMessages.successPopup('Data Kapanewon Berhasil Ditambahkan');
            },
            updated: () async {
              context.read<KapanewonCubit>().getKapanewon();
              PopupMessages.successPopup('Data Kapanewon Berhasil Diubah');
            },
            deleted: () async {
              context.read<KapanewonCubit>().getKapanewon();
              PopupMessages.successPopup('Data Kapanewon Berhasil Dihapus');
            },
            orElse: () {},
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
            loaded: (kapanewon) => _KapanewonLayout(kapanewon: kapanewon),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class _KapanewonLayout extends StatelessWidget {
  final List<Kapanewon> kapanewon;

  const _KapanewonLayout({Key? key, required this.kapanewon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KapanewonCubit>();
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
                hintText: 'Cari Kapanewon (Nama, Kode Area)',
                hintStyle: TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                cubit.searchKapanewon();
              },
            ),
            const SizedBox(height: 10),
            PaginatedDataTable(
              source: KapanewonData(context, kapanewon, cubit),
              header: 'Data Kapanewon'.text.xl.make(),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Kode Area')),
                DataColumn(label: Text('Action')),
              ],
              columnSpacing: 50,
              horizontalMargin: 20,
              rowsPerPage: 5,
              showCheckboxColumn: false,
            ),
            const SizedBox(height: 100),
          ],
        ).centered().p16().scrollVertical(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          cubit.clear();
          VxDialog.showCustom(
            context,
            child: AddKapanewonDialog(cubit: cubit),
          );
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Kapanewon'.text.base.make(),
        ]),
      ),
    );
  }
}

class KapanewonData extends DataTableSource {
  final BuildContext context;
  final List<Kapanewon> kapanewon;
  final KapanewonCubit cubit;
  String role = '';

  KapanewonData(this.context, this.kapanewon, this.cubit);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => kapanewon.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell((index + 1).toString().text.isIntrinsic.make()),
      DataCell(kapanewon[index].areaName.text.isIntrinsic.make()),
      DataCell(kapanewon[index].kodeArea.text.isIntrinsic.make()),
      DataCell(
        HStack([
          GestureDetector(
            onTap: () {
              VxDialog.showCustom(
                context,
                child: EditKapanewonDialog(
                  cubit: cubit,
                  kapanewon: kapanewon[index],
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
              PopupMessages.confirmPopup(context, () {
                cubit.deleteKapanewon(kapanewon[index].areaId);
                Get.back();
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
