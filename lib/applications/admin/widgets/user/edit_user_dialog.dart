import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:velocity_x/velocity_x.dart';

class EditUserDialog extends StatelessWidget {
  final UserCubit cubit;
  final User? user;

  const EditUserDialog({Key? key, required this.cubit, this.user})
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
            controller: cubit.name..text = user!.name,
            hint: 'Masukkan Nama',
          ),
          const SizedBox(height: 10),
          FormFields.textFormField(
            controller: cubit.email..text = user!.email,
            hint: 'Masukkan Email',
          ),
          const SizedBox(height: 10),
          FormFields.textFormField(
            controller: cubit.password,
            hint: 'Masukkan Password',
            isObscure: true,
          ),
          const SizedBox(height: 10),
          FormFields.textFormField(
            controller: cubit.confirmPassword,
            hint: 'Ulangi Password',
            isObscure: true,
          ),
          const SizedBox(height: 10),
          ...user!.roles.map(
            (e) => DropdownButtonFormField<String>(
              hint: 'Pilih Role'.text.base.make(),
              value: e.name,
              items: [
                ...roles.map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: e.text.base.make(),
                  ),
                ),
              ],
              onChanged: (e) {},
            ).box.width(Get.width).make().pOnly(bottom: 10),
          )
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
              Navigator.pop(context, true);
            },
            child: 'Simpan'.text.base.make(),
          ).box.width(Get.width / 3).make(),
        ])
      ]).p16(),
    );
  }
}
