import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class DataUstadzPage extends StatelessWidget {
  final DataTableSource _data = MyData();

  DataUstadzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Data Ustadz'.text.xl.color(Colors.white).make(),
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
            header: 'Data Ustadz'.text.xl.make(),
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
                  'Input Data Ustadz'.text.xl.bold.make().pOnly(bottom: 10),
                  VStack([
                    'Nama Data Ustadz'.text.base.bold.make(),
                    TextFormField()
                        .stylized(hint: 'Masukkan Nama Data Ustadz')
                        .pOnly(bottom: 10),
                    'Kode Data Ustadz'.text.base.bold.make(),
                    TextFormField()
                        .stylized(hint: 'Kode Pos Data Ustadz')
                        .pOnly(bottom: 10),
                  ]),
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
          'Tambah Data Ustadz'.text.base.make(),
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
