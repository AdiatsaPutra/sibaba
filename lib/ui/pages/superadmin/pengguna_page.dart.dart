import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/constants.dart';
import 'package:sibaba/core/core.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/user_cubit.dart';
import 'package:sibaba/models/user_model.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class PenggunaPage extends StatefulWidget {
  @override
  _PenggunaPageState createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 180.h,
                width: Get.width.w,
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pengguna',
                          style: whiteRegular.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Core.showPopupDialog(
                                context,
                                'Tambah Pengguna Baru',
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        label: 'Nama',
                                        hintText: 'Masukkan Nama',
                                      ),
                                      CustomTextField(
                                        label: 'Email',
                                        hintText: 'Masukkan Email',
                                      ),
                                      CustomTextField(
                                        label: 'Password',
                                        hintText: 'Minimal 8 Karakter',
                                      ),
                                      CustomTextField(
                                        label: 'Konfirmasi Password',
                                        hintText: 'Konfirmasi Password',
                                      ),
                                      DropdownButton(
                                        hint: Text(role),
                                        value: role,
                                        items: roles.map((value) {
                                          return DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            role = value.toString();
                                            print(role);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: Get.width,
                                        height: 40.h,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Simpan',
                                            style: whiteRegular,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          child: Text(
                            'Tambah Pegguna Baru',
                            style: whiteSmall,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Print',
                                style: whiteSmall,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Excel',
                                style: whiteSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserFetched) {
                        List<UserModel> users = state.userModel;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            color: Colors.white,
                            child: DataTable(
                              showBottomBorder: true,
                              columns: <DataColumn>[
                                DataColumn(
                                    label: const Text(
                                      'No',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onSort: (columnIndex, _) {
                                      setState(() {
                                        _currentSortColumn = columnIndex;
                                        if (_isAscending == true) {
                                          _isAscending = false;
                                          users.sort((penggunaA, penggunaB) =>
                                              penggunaB.id!
                                                  .compareTo(penggunaA.id!));
                                        } else {
                                          _isAscending = true;
                                          users.sort((penggunaA, penggunaB) =>
                                              penggunaA.id!
                                                  .compareTo(penggunaB.id!));
                                        }
                                      });
                                    }),
                                const DataColumn(
                                  label: Text(
                                    'ID',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Nama',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Email',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Roles',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Action',
                                  ),
                                ),
                              ],
                              rows: users
                                  .map(
                                    (e) => DataRow(
                                      cells: [
                                        DataCell(Text(e.id.toString())),
                                        DataCell(Text(e.id.toString())),
                                        DataCell(Text(e.name.toString())),
                                        DataCell(Text(e.email.toString())),
                                        DataCell(Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: e.roles!
                                                .map((e) => Text(e.name!))
                                                .toList())),
                                        DataCell(
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow),
                                                onPressed: () {
                                                  Core.showPopupDialog(
                                                    context,
                                                    'Edit Data',
                                                    Text('data'),
                                                  );
                                                },
                                                child: Text('Edit'),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red),
                                                onPressed: () {},
                                                child: Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (state is UserError) {
                        return Text(state.message.toString());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
