import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/core.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/kontak_kami_page.dart';
import 'package:sibaba/ui/pages/tentang_kami_page.dart';
import 'package:sibaba/ui/pages/lokasi_page.dart';
import 'package:sibaba/ui/pages/sign_in_page.dart';
import 'package:sibaba/ui/widgets/category_menu.dart';

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
        child: Stack(
          children: [
            Container(
              height: 180.h,
              width: Get.width.w,
              padding: const EdgeInsets.all(13),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Column(
                    children: [
                      Text(
                        'Selamat Datang di BADKO Kabupaten Bantul',
                        style: whiteRegular.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 100.h,
                        width: Get.width.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.grey.withOpacity(0.5),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            'Kami membantu anda dalam mencari tempat yang tepat bagi anda untuk belajar bersama kami!',
                            style: darkRegular.copyWith(fontSize: 13.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryMenu(
                            title: 'Info Lokasi',
                            onTap: () {
                              Get.to(() => const LokasiPage());
                            },
                            iconData: Icons.place,
                            color: Colors.red,
                          ),
                          CategoryMenu(
                            title: 'Tentang Kami',
                            onTap: () {
                              Get.to(() => TentangKamiPage());
                            },
                            iconData: Icons.account_box,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryMenu(
                            title: 'Kontak Kami',
                            onTap: () {
                              Get.to(() => const KontakKamiPage());
                            },
                            iconData: Icons.mail,
                            color: Colors.purple,
                          ),
                          CategoryMenu(
                            title: 'Masuk',
                            onTap: () {
                              Get.to(() => SignInPage());
                            },
                            iconData: Icons.lock,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
