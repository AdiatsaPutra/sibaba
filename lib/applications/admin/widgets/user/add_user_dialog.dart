import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:velocity_x/velocity_x.dart';

class AddUserDialog extends StatelessWidget {
  final UserCubit cubit;

  const AddUserDialog({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: VStack([
        'Input Data Pengguna'.text.xl.bold.make().pOnly(bottom: 10),
        Form(
          key: cubit.formkey,
          child: VStack([
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.name,
              validator: (value) {
                if (value == "") {
                  return 'Mohon isi nama';
                }
                return null;
              },
              hint: 'Masukkan Nama',
            ),
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.email,
              validator: (value) {
                if (value == "") {
                  return 'Mohon isi email';
                }
                return null;
              },
              hint: 'Masukkan Email',
            ),
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.password,
              validator: (value) {
                if (value == "") {
                  return 'Mohon isi password';
                } else if (value!.length < 8) {
                  return 'Password minimal 8';
                }
                return null;
              },
              hint: 'Masukkan Password',
              isObscure: true,
            ),
            const SizedBox(height: 10),
            FormFields.textFormField(
              controller: cubit.confirmPassword,
              validator: (value) {
                if (value == "" || value != cubit.password.text) {
                  return 'Konfirmasi pasword tidak sama dengan password';
                }
                return null;
              },
              hint: 'Ulangi Password',
              isObscure: true,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              hint: 'Pilih Role'.text.lg.make(),
              items: [
                ...roles.map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: e.text.lg.make(),
                  ),
                ),
              ],
              validator: (value) {
                if (value == null) {
                  return 'Pilih role';
                }
                return null;
              },
              onChanged: (e) {
                cubit.role = e!;
              },
            ).box.width(Get.width).make().pOnly(bottom: 10),
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
              if (cubit.formkey.currentState!.validate()) {
                cubit.formkey.currentState!.save();
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
