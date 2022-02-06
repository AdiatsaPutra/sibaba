import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/kapanewon/kapanewon_cubit.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:velocity_x/velocity_x.dart';

class AddKapanewonDialog extends StatelessWidget {
  final KapanewonCubit cubit;

  const AddKapanewonDialog({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: VStack([
        'Input Data Kapanewon'.text.xl.bold.make().pOnly(bottom: 10),
        Form(
          key: cubit.key,
          child: VStack([
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.name,
              validator: (value) {
                if (value == "") {
                  return 'Mohon isi nama';
                }
              },
              hint: 'Masukkan Nama',
            ),
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.kode,
              validator: (value) {
                if (value == "") {
                  return 'Mohon isi kode';
                }
              },
              hint: 'Masukkan Kode',
            ),
          ]),
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: 'Batal'.text.base.color(Colors.grey).make(),
          ).box.width(Get.width / 3).make(),
          ElevatedButton(
            onPressed: () {
              if (cubit.key.currentState!.validate()) {
                cubit.key.currentState!.save();
                cubit.addUser();
                Get.back();
              }
            },
            child: 'Simpan'.text.base.make(),
          ).box.width(Get.width / 3).make(),
        ])
      ]).p16().scrollVertical(),
    );
  }
}
