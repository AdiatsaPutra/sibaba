import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/constants.dart';
import 'package:sibaba/core/core.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/custom_login_textfield.dart';

class PenggunaPage extends StatefulWidget {
  @override
  _PenggunaPageState createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  final List<Map> pengguna = List.generate(30, (i) {
    return {
      "no": i + 1,
      "id": Random().nextInt(8),
      "nama": "Pengguna $i",
      "email": "faysfasffa",
      "role": "auhsdhsdh",
    };
  });

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
                decoration: BoxDecoration(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.white,
                      child: DataTable(
                        showBottomBorder: true,
                        columns: <DataColumn>[
                          DataColumn(
                              label: Text(
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
                                    pengguna.sort((penggunaA, penggunaB) =>
                                        penggunaB['no']
                                            .compareTo(penggunaA['no']));
                                  } else {
                                    _isAscending = true;
                                    pengguna.sort((penggunaA, penggunaB) =>
                                        penggunaA['no']
                                            .compareTo(penggunaB['no']));
                                  }
                                });
                              }),
                          DataColumn(
                            label: Text(
                              'ID',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Nama',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Email',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Roles',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Action',
                            ),
                          ),
                        ],
                        rows: pengguna
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text(e['no'].toString())),
                                  DataCell(Text(e['id'].toString())),
                                  DataCell(Text('addadwdefe')),
                                  DataCell(Text('tyfytafsftasf')),
                                  DataCell(Text('fastfgaysg')),
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
