import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/pages/dashboard_page.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/applications/login/bloc/login_password/login_password_cubit.dart';
import 'package:sibaba/applications/login/bloc/register/register_cubit.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterForm extends StatelessWidget {
  final RegisterCubit cubit;
  final VoidCallback onTap;

  const RegisterForm({Key? key, required this.cubit, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.key,
      child: VStack([
        'Daftar'.text.lg.bold.make(),
        const SizedBox(height: 10),
        'Nama'.text.base.bold.make(),
        TextFormField(
          controller: cubit.name,
          decoration: const InputDecoration(hintText: 'Masukkan Nama'),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == "") {
              return 'Masukkan Nama';
            }
          },
        ),
        const SizedBox(height: 10),
        'Email'.text.base.bold.make(),
        TextFormField(
          controller: cubit.email,
          decoration: const InputDecoration(hintText: 'Masukkan Email'),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == "") {
              return 'Masukkan Email';
            }
          },
        ),
        const SizedBox(height: 10),
        'Password'.text.base.bold.make(),
        BlocBuilder<LoginPasswordCubit, LoginPasswordState>(
          builder: (context, state) {
            return TextFormField(
              controller: cubit.password,
              obscureText: context.read<LoginPasswordCubit>().isObscure,
              decoration: InputDecoration(
                hintText: 'Masukkan Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<LoginPasswordCubit>().setObscure();
                  },
                  child: Icon(
                    context.read<LoginPasswordCubit>().isObscure == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              validator: (value) {
                if (value == "") {
                  return 'Masukkan Password';
                }
              },
            );
          },
        ),
        const SizedBox(height: 10),
        'Konfirmasi Password'.text.base.bold.make(),
        BlocBuilder<LoginPasswordCubit, LoginPasswordState>(
          builder: (context, state) {
            return TextFormField(
              controller: cubit.confirmPassword,
              obscureText: context.read<LoginPasswordCubit>().isConfirmObscure,
              decoration: InputDecoration(
                hintText: 'Masukkan Konfirmasi Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<LoginPasswordCubit>().setConfirmObscure();
                  },
                  child: Icon(
                    context.read<LoginPasswordCubit>().isConfirmObscure == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              validator: (value) {
                if (value != cubit.password.text) {
                  return 'Password dan Konfirmasi Password Tidak Sama';
                }
              },
            );
          },
        ),
        const SizedBox(height: 10),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) => state.maybeWhen(
            loaded: (user) {
              cubit.clear();
              Get.to(() => DashboardPage(user: user));
            },
            error: (message) => PopupMessages.errorPopup('Periksa data anda'),
            orElse: () {},
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => ElevatedButton(
              onPressed: null,
              child: const CircularProgressIndicator()
                  .centered()
                  .box
                  .width(20)
                  .height(20)
                  .make(),
            ),
            orElse: () => ElevatedButton(
              onPressed: () {
                if (cubit.key.currentState!.validate()) {
                  cubit.key.currentState!.save();
                  cubit.register();
                }
              },
              child: 'Masuk'.text.color(Colors.white).base.make(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        HStack([
          'Sudah punya akun? '.text.base.make(),
          GestureDetector(
            onTap: onTap,
            child: 'Masuk'.text.base.bold.color(primaryColor).make(),
          )
        ]).centered()
      ]).p16(),
    );
  }
}
