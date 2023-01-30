import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/kapanewon/kapanewon_cubit.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:velocity_x/velocity_x.dart';

class EditKapanewonDialog extends StatelessWidget {
  final KapanewonCubit cubit;
  final Kapanewon? kapanewon;

  const EditKapanewonDialog({Key? key, required this.cubit, this.kapanewon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: VStack([
        'Edit Data Pengguna'.text.xl.bold.make().pOnly(bottom: 10),
        VStack([
          const SizedBox(height: 10),
          FormFields.textFormField(
            controller: cubit.name..text = kapanewon!.areaName,
            hint: 'Masukkan Nama',
          ),
          const SizedBox(height: 10),
          FormFields.textFormField(
            controller: cubit.kode..text = kapanewon!.kodeArea,
            hint: 'Masukkan Kode',
          ),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: 'Batal'.text.base.color(Colors.grey).make(),
          ).box.width(Get.width / 3).make(),
          ElevatedButton(
            onPressed: () {
              cubit.updateKapanewon(kapanewon!.areaId);
              Navigator.pop(context, true);
            },
            child: 'Simpan'.text.base.make(),
          ).box.width(Get.width / 3).make(),
        ])
      ]).p16(),
    );
  }
}
