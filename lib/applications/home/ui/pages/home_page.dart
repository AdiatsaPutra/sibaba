import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibaba/applications/admin/pages/dashboard_page.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/applications/home/ui/widgets/home_menu.dart';
import 'package:sibaba/applications/info_lokasi/ui/pages/location_info_list_page.dart';
import 'package:sibaba/applications/kontak_kami/pages/kontak_kami_page.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/applications/login/pages/login_page.dart';
import 'package:sibaba/applications/tentang_kami/pages/tentang_kami_page.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email;
  bool isLoggedIn = false;
  @override
  void initState() {
    getUser(context.read<LoginCubit>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginCubit>();
    return Scaffold(
      body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: 'Tekan sekali lagi untuk keluar'.text.base.make(),
          ),
          child: VStack([
            const SizedBox(height: 30),
            HStack([
              VStack([
                const Text.rich(
                  TextSpan(
                      text: 'Selamat Datang di ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'SIBABA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                        TextSpan(
                          text: '\nKabupaten Bantul',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 10),
                'Sistem informasi BADKODA TKA-TPA\nBantul'
                    .text
                    .size(12)
                    .color(Colors.black)
                    .make(),
              ]),
              const SizedBox().expand(),
              Image.asset(
                'assets/logo.png',
                width: 100,
              ),
            ]),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Builder(
                builder: (context) => email == null
                    ? HomeMenu(
                        imagePath: 'assets/masuk.png',
                        width: Get.width / 2 - 20,
                        onTap: () {
                          Get.to(LoginPage());
                        },
                      )
                    : BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) => state.maybeWhen(
                          loading: () => showDialog(
                            context: context,
                            builder: (context) =>
                                const CircularProgressIndicator().centered(),
                          ),
                          loaded: (user) {
                            login.email.clear();
                            login.password.clear();
                            Get.to(() => DashboardPage(user: user));
                          },
                          orElse: () {},
                        ),
                        child: HomeMenu(
                          imagePath: 'assets/home.png',
                          width: Get.width / 2 - 20,
                          onTap: () {
                            login.login();
                          },
                        ),
                      ),
              ),
              HomeMenu(
                imagePath: 'assets/info_lokasi.png',
                width: Get.width / 2 - 20,
                onTap: () {
                  Get.to(() => const InfoLokasiPage());
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              HomeMenu(
                imagePath: 'assets/kontak.png',
                width: Get.width / 2 - 20,
                onTap: () {
                  Get.to(() => const KontakKamiPage());
                },
              ),
              HomeMenu(
                imagePath: 'assets/tentang.png',
                width: Get.width / 2 - 20,
                onTap: () {
                  Get.to(() => const TentangKamiPage());
                },
              ),
            ])
          ]).p12().scrollVertical()),
    );
  }

  void getUser(LoginCubit login) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final emailUser = sharedPreferences.getString('email');
      final passwordUser = sharedPreferences.getString('password');
      email = emailUser;
      login.email.text = emailUser!;
      login.password.text = passwordUser!;
      setState(() {
        isLoggedIn = true;
      });
    } catch (e) {
      setState(() {
        isLoggedIn = false;
      });
    }
  }
}
