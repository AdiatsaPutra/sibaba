import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/pages/dashboard_page.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Login',
        elevation: 0,
      ),
      body: VStack([
        Image.asset('assets/logo.png')
            .box
            .width(Get.width / 3)
            .height(Get.height / 3)
            .makeCentered(),
        Form(
          key: cubit.key,
          child: VStack([
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
                  cubit.setUser(user);
                  Get.to(() => const DashboardPage());
                },
                error: (message) =>
                    PopupMessages.errorPopup('Periksa data anda'),
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
            )
          ]).p16(),
        )
      ]).scrollVertical(),
    );
  }
}
