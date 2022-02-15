import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/applications/login/bloc/register/register_cubit.dart';
import 'package:sibaba/applications/login/widgets/login_form.dart';
import 'package:sibaba/applications/login/widgets/register_form.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginCubit>();
    final register = context.read<RegisterCubit>();
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
        PageView(
          controller: pageController,
          children: [
            LoginForm(
              cubit: login,
              onTap: () {
                if (pageController.hasClients) {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            RegisterForm(
              cubit: register,
              onTap: () {
                if (pageController.hasClients) {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            )
          ],
        ).box.height(Get.height / 1.5).make()
      ]).scrollVertical(),
    );
  }
}
