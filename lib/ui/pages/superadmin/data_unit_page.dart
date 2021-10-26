import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/superadmin/data_unit/kapanewon_page.dart';
import 'package:sibaba/ui/pages/superadmin/data_unit/lokasi_unit_page.dart';
import 'package:sibaba/ui/pages/superadmin/settings/galery_setting_page.dart';
import 'package:sibaba/ui/pages/superadmin/settings/kontak_page.dart';
import 'package:sibaba/ui/pages/superadmin/settings/pesan_page.dart';
import 'package:sibaba/ui/pages/superadmin/settings/profil_website_page.dart';
import 'package:sibaba/ui/widgets/setting_card.dart';

class DataUnitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 180.h,
                width: Get.width.w,
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Data Unit',
                      style: whiteRegular.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    CategoryTile(
                      color: Colors.amber,
                      icon: Icons.person,
                      title: 'Kapanewon',
                      onTap: () {
                        Get.to(() => KapanewonPage());
                      },
                    ),
                    CategoryTile(
                      color: Colors.indigo,
                      icon: Icons.image,
                      title: 'Kelurahan',
                      onTap: () {
                        Get.to(() => GalerySettingPage());
                      },
                    ),
                    CategoryTile(
                      color: Colors.red,
                      icon: Icons.message,
                      title: 'Lokasi Unit',
                      onTap: () {
                        Get.to(() => const LokasiUnitPage());
                      },
                    ),
                    CategoryTile(
                      color: Colors.green,
                      icon: Icons.phone,
                      title: 'Data Ustadz',
                      onTap: () {
                        Get.to(() => KontakPage());
                      },
                    ),
                    CategoryTile(
                      color: Colors.purple,
                      icon: Icons.phone,
                      title: 'Data Santri',
                      onTap: () {
                        Get.to(() => KontakPage());
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
