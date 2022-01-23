import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class KelurahanPage extends StatelessWidget {
  final DataTableSource _data = MyData();

  KelurahanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Data Kelurahan'.text.xl.color(Colors.white).make(),
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
            header: 'Data Kelurahan'.text.xl.make(),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price'))
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 5,
            showCheckboxColumn: false,
          ),
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
          'Tambah Kelurahan'.text.base.make(),
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
