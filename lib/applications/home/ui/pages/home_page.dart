import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/applications/home/ui/widgets/home_menu.dart';
import 'package:sibaba/applications/info_lokasi/ui/pages/location_info_list_page.dart';
import 'package:sibaba/applications/kontak_kami/pages/kontak_kami_page.dart';
import 'package:sibaba/applications/login/pages/login_page.dart';
import 'package:sibaba/applications/tentang_kami/pages/tentang_kami_page.dart';
import 'package:sibaba/presentation/core.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () {
            return Core.showPopupDialog(
              context,
              'Konfirmasi Keluar',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Tidak'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: const Text('Ya'),
                  ),
                ],
              ),
            );
          },
          child: ZStack([
            VxBox()
                .width(Get.width)
                .height(230)
                .color(Theme.of(context).primaryColor)
                .bottomRounded(value: 15)
                .make(),
            VStack([
              const SizedBox(height: 30),
              'Selamat Datang di BADKO Kabupaten Bantul'
                  .text
                  .xl
                  .bold
                  .color(Colors.white)
                  .make(),
              const SizedBox(height: 10),
              'Kami membantu anda dalam mencari tempat yang tepat bagi anda untuk belajar bersama kami!'
                  .text
                  .base
                  .color(Colors.white)
                  .make(),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                HomeMenu(
                  imagePath: 'assets/locations.png',
                  title: 'Info Lokasi',
                  onTap: () {
                    Get.to(const InfoLokasiPage());
                  },
                ),
                HomeMenu(
                  imagePath: 'assets/about.png',
                  title: 'Tentang Kami',
                  onTap: () {
                    Get.to(() => const TentangKamiPage());
                  },
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                HomeMenu(
                  imagePath: 'assets/contact_us.png',
                  title: 'Kontak Kami',
                  onTap: () {
                    Get.to(() => const KontakKamiPage());
                  },
                ),
                HomeMenu(
                  imagePath: 'assets/sign_in.png',
                  title: 'Sign In',
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                ),
              ])
            ]).p16().scrollVertical(),
          ])),
    );
  }

  void getUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.getString('user');
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
