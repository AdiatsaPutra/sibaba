import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/constants.dart';
import 'package:sibaba/core/core.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/custom_login_textfield.dart';

class KapanewonPage extends StatefulWidget {
  @override
  _KapanewonPageState createState() => _KapanewonPageState();
}

class _KapanewonPageState extends State<KapanewonPage> {
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
              Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Data Kapanewon',
                          style: whiteRegular.copyWith(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Core.showPopupDialog(
                            context,
                            'Tambah Kapanewon',
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  CustomTextField(
                                    label: 'Nama',
                                    hintText: 'Masukkan Nama',
                                  ),
                                  CustomTextField(
                                    label: 'Kode Pos',
                                    hintText: 'Masukkan Kode Pos',
                                    textInputType: TextInputType.number,
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
                        'Tambah Kapanewon',
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
                    SizedBox(
                      height: 20.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: Colors.white,
                        child: DataTable(
                          showBottomBorder: true,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'No',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nama',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Kode Pos',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Action',
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('guasuhuhs')),
                                DataCell(Text('726387')),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
