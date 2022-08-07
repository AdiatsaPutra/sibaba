import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/widgets/user/add_user_dialog.dart';
import 'package:sibaba/applications/admin/widgets/user/edit_user_dialog.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

class PenggunaPage extends StatelessWidget {
  const PenggunaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: 'Data Pengguna'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) => state.maybeWhen(
            added: () {
              context.read<UserCubit>().getUsers();
              PopupMessages.successPopup('Data Pengguna Berhasil Ditambahkan');
            },
            edited: () {
              context.read<UserCubit>().getUsers();
              PopupMessages.successPopup('Data Pengguna Berhasil Diubah');
            },
            deleted: () async {
              context.read<UserCubit>().getUsers();
              PopupMessages.successPopup('Data Pengguna Berhasil Dihapus');
            },
            orElse: () {},
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => const LoadingIndicator(isScrollable: true),
            loaded: (users) => _PenggunaLayout(users: users),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class _PenggunaLayout extends StatelessWidget {
  final List<User> users;

  const _PenggunaLayout({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserCubit>().getUsers();
        },
        child: VStack(
          [
            TextFormField(
              controller: cubit.searchKeyword,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari Pengguna (Nama atau Email)',
                hintStyle: TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                cubit.searchUser();
              },
            ),
            const SizedBox(height: 10),
            PaginatedDataTable(
              source: UsersData(context, users, cubit),
              header: 'Data Pengguna'.text.xl.make(),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Action')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Role')),
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
            child: AddUserDialog(cubit: cubit),
          );
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Pengguna'.text.base.make(),
        ]),
      ),
    );
  }
}

class UsersData extends DataTableSource {
  final BuildContext context;
  final List<User> users;
  final UserCubit cubit;
  String role = '';

  UsersData(this.context, this.users, this.cubit);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => users.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell((index + 1).toString().text.isIntrinsic.make()),
      DataCell(
        HStack([
          GestureDetector(
            onTap: () {
              VxDialog.showCustom(
                context,
                child: BlocProvider.value(
                  value: cubit,
                  child: EditUserDialog(
                    cubit: cubit,
                    user: users[index],
                  ),
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
                cubit.deleteUser(users[index].id);
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
      DataCell(users[index].id.toString().text.isIntrinsic.make()),
      DataCell(users[index].name.text.isIntrinsic.make()),
      DataCell(users[index].email.text.isIntrinsic.make()),
      DataCell(
        VStack(
            [...users[index].roles.map((e) => e.name.text.isIntrinsic.make())]),
      ),
    ]);
  }
}
