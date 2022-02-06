import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class LokasiUnitPage extends StatelessWidget {
  final DataTableSource _data = MyData();

  LokasiUnitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Lokasi Unit'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
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
            source: _data,
            header: HStack([
              'Data Lokasi Unit'.text.xl.make().expand(),
            ]),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price'))
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 5,
            showCheckboxColumn: false,
          ).box.outerShadowXl.make(),
        ],
      ).centered().p16().scrollVertical(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          final res = VxDialog.showCustom(context,
              child: Dialog(
                insetPadding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                child: VxBox(
                  child: VStack([
                    'Input Data Unit'.text.xl.bold.make().pOnly(bottom: 10),
                    VStack([
                      'NSPQ'.text.base.bold.make(),
                      TextFormField()
                          .stylized(hint: 'Masukkan NSPQ')
                          .pOnly(bottom: 10),
                      'Nama'.text.base.bold.make(),
                      TextFormField().stylized(hint: 'Nama').pOnly(bottom: 10),
                      'Alamat'.text.base.bold.make(),
                      TextFormField()
                          .stylized(hint: 'Alamat')
                          .pOnly(bottom: 10),
                      'No Telp'.text.base.bold.make(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                      ).stylized(hint: 'No Telp').pOnly(bottom: 10),
                      'SK Pendirian'.text.base.bold.make(),
                      TextFormField()
                          .stylized(hint: 'SK Pendirian')
                          .pOnly(bottom: 10),
                      'Tempat Belajar'.text.base.bold.make(),
                      TextFormField()
                          .stylized(hint: 'Tempat Belajar')
                          .pOnly(bottom: 10),
                      'Email'.text.base.bold.make(),
                      TextFormField().stylized(hint: 'Email').pOnly(bottom: 10),
                      'Pilih Akreditasi'.text.base.bold.make(),
                      DropdownButtonFormField<String>(
                        hint: 'Pilih Akreditasi'
                            .text
                            .base
                            .color(Colors.grey)
                            .make(),
                        items: [
                          ...akreditasi.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: e.text.base.make(),
                            ),
                          ),
                        ],
                        onChanged: (e) {},
                      ).pOnly(bottom: 10),
                      'Tanggal Berdiri'.text.base.bold.make(),
                      DateTimeField(
                        decoration: const InputDecoration(
                            hintText: 'Tanggal Berdiri',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            )),
                        format: DateFormat('dd/MM/yyyy'),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ).pOnly(bottom: 10),
                      'Direktur'.text.base.bold.make(),
                      TextFormField()
                          .stylized(hint: 'Direktur')
                          .pOnly(bottom: 10),
                      'Tanggal Akreditasi'.text.base.bold.make(),
                      DateTimeField(
                        decoration: const InputDecoration(
                            hintText: 'Tanggal Akreditasi',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            )),
                        format: DateFormat('dd/MM/yyyy'),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ).pOnly(bottom: 10),
                      'Status'.text.base.bold.make(),
                      DropdownButtonFormField<String>(
                        hint: 'Status'.text.base.color(Colors.grey).make(),
                        items: [
                          ...status.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: e.text.base.make(),
                            ),
                          ),
                        ],
                        onChanged: (e) {},
                      ).pOnly(bottom: 10),
                      'Deskripsi'.text.base.bold.make(),
                      HtmlEditor(controller: HtmlEditorController())
                          .pOnly(bottom: 10),
                      'Hari Masuk'.text.base.bold.make(),
                      DropdownButtonFormField<String>(
                        hint: 'Hari Masuk'.text.base.color(Colors.grey).make(),
                        items: [
                          ...listHari.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: e.text.base.make(),
                            ),
                          ),
                        ],
                        onChanged: (e) {},
                      ).pOnly(bottom: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VStack([
                            'Jam Masuk'.text.base.bold.make(),
                            DateTimeField(
                              decoration: const InputDecoration(
                                  hintText: 'Jam Masuk',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                              format: DateFormat('hh:mm'),
                              onShowPicker: (context, currentValue) async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.convert(time);
                              },
                            )
                                .box
                                .width(Get.width / 2.5)
                                .make()
                                .pOnly(bottom: 10),
                          ]),
                          VStack([
                            'Jam Keluar'.text.base.bold.make(),
                            DateTimeField(
                              decoration: const InputDecoration(
                                  hintText: 'Jam Masuk',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                              format: DateFormat('hh:mm'),
                              onShowPicker: (context, currentValue) async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.convert(time);
                              },
                            )
                                .box
                                .width(Get.width / 2.5)
                                .make()
                                .pOnly(bottom: 10),
                          ]),
                        ],
                      )
                    ]).scrollVertical().expand(),
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
                  ]),
                ).width(Get.width).height(Get.height).p16.make().pOnly(top: 10),
              ));
        },
        label: HStack([
          const Icon(Icons.add),
          'Tambah Kapanewon'.text.base.make(),
        ]),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index + 1,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}
