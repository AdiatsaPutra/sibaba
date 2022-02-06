import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
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
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
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
    return Scaffold(
      body: VStack(
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
            source: UsersData(users),
            header: 'Data Pengguna'.text.xl.make(),
            columns: const [
              DataColumn(label: Text('No')),
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Role')),
              DataColumn(label: Text('Action')),
            ],
            columnSpacing: 50,
            horizontalMargin: 20,
            rowsPerPage: 20,
            showCheckboxColumn: false,
          ),
          const SizedBox(height: 100),
        ],
      ).centered().p16().scrollVertical(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          final res = VxDialog.showCustom(context,
              child: Dialog(
                insetPadding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                child: VStack([
                  'Input Data Unit'.text.xl.bold.make().pOnly(bottom: 10),
                  VStack([
                    const SizedBox(height: 10),
                    'Pilih Kapanawon'.text.base.bold.make(),
                    DropdownButtonFormField<String>(
                      hint:
                          'Pilih Kapanewon'.text.base.color(Colors.grey).make(),
                      items: [],
                      onChanged: (e) {},
                    ),
                    const SizedBox(height: 10),
                    'Nama Kelurahan'.text.base.bold.make(),
                    TextFormField()
                        .stylized(hint: 'Masukkan Nama Kelurahan')
                        .pOnly(bottom: 10),
                  ]),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: 'Batal'.text.base.color(Colors.grey).make(),
                        ).box.width(Get.width / 3).make(),
                        ElevatedButton(
                          onPressed: () {},
                          child: 'Simpan'.text.base.make(),
                        ).box.width(Get.width / 3).make(),
                      ])
                ]).p16(),
              ));
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
  final List<User> users;

  UsersData(this.users);

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
      DataCell(users[index].id.toString().text.isIntrinsic.make()),
      DataCell(users[index].name.text.isIntrinsic.make()),
      DataCell(users[index].email.text.isIntrinsic.make()),
      DataCell(
        VStack(
            [...users[index].roles.map((e) => e.name.text.isIntrinsic.make())]),
      ),
      DataCell(
        HStack([
          VxCapsule(
            width: 50,
            height: 20,
            backgroundColor: Colors.yellow,
            child: 'Edit'.text.sm.makeCentered(),
          ),
          const SizedBox(width: 10),
          VxCapsule(
            width: 50,
            height: 20,
            backgroundColor: Colors.red,
            child: 'Delete'.text.sm.color(Colors.white).makeCentered(),
          ),
        ]),
      ),
    ]);
  }
}
