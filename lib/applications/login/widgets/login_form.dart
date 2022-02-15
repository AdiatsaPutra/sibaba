import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/pages/dashboard_page.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginForm extends StatelessWidget {
  final LoginCubit cubit;
  final VoidCallback onTap;

  const LoginForm({Key? key, required this.cubit, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.key,
      child: VStack([
        'Masuk'.text.lg.bold.make(),
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
        TextFormField(
          controller: cubit.password,
          decoration: const InputDecoration(hintText: 'Masukkan Password'),
          validator: (value) {
            if (value == "") {
              return 'Masukkan Password';
            }
          },
        ),
        const SizedBox(height: 10),
        BlocConsumer<LoginCubit, LoginState>(
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
                  cubit.login();
                }
              },
              child: 'Masuk'.text.color(Colors.white).base.make(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        HStack([
          'Belum punya akun? '.text.base.make(),
          GestureDetector(
            onTap: onTap,
            child: 'Daftar'.text.base.bold.color(primaryColor).make(),
          )
        ]).centered()
      ]).p16(),
    );
  }
}
