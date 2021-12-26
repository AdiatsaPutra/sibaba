import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/applications/home/ui/widgets/home_menu.dart';
import 'package:sibaba/applications/info_lokasi/ui/pages/info_lokasi_page.dart';
import 'package:sibaba/applications/tentang_kami/pages/tentang_kami_page.dart';
import 'package:sibaba/presentation/core.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                .bottomRounded(value: 30)
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
              HomeMenu(
                imagePath: 'assets/contact_us.png',
                title: 'Kontak Kami',
                onTap: () {},
              ),
              HomeMenu(
                imagePath: 'assets/sign_in.png',
                title: 'Sign In',
                onTap: () {},
              ),
            ]).p16().scrollVertical(),
          ])),
    );
  }
}
