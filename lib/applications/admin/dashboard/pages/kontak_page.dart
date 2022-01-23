import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Data Kontak'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: VStack(
        [
          VStack([
            VStack([
              const SizedBox(height: 10),
              'Alamat'.text.base.bold.make(),
              TextFormField()
                  .stylized(hint: 'Masukkan Alamat')
                  .pOnly(bottom: 10),
              'Link Maps'.text.base.bold.make(),
              TextFormField()
                  .stylized(hint: 'Masukkan Link Maps')
                  .pOnly(bottom: 10),
              'Telepon'.text.base.bold.make(),
              TextFormField()
                  .stylized(hint: 'Masukkan Telepon')
                  .pOnly(bottom: 10),
              'Hari Masuk'.text.base.bold.make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonFormField<String>(
                    items: [
                      ...listHari.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: e.text.base.make(),
                        ),
                      ),
                    ],
                    onChanged: (e) {},
                  ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                  'S/D'.text.base.make(),
                  DropdownButtonFormField<String>(
                    items: [
                      ...listHari.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: e.text.base.make(),
                        ),
                      ),
                    ],
                    onChanged: (e) {},
                  ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                ],
              ),
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
                    ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
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
                    ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                  ]),
                ],
              )
            ]),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: 'Simpan'.text.base.make(),
            ),
          ]),
        ],
      ).centered().p16().scrollVertical(),
    );
  }
}
