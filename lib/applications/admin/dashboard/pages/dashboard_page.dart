import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/dashboard/widgets/kategori_item.dart';
import 'package:sibaba/presentation/core.dart';
import 'package:velocity_x/velocity_x.dart';

import 'data_unit_page.dart';
import 'user_profil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Selamat Datang di Dashboard Superadmin TKA-TPA Kabupaten Bantul'
            .text
            .color(Colors.white)
            .base
            .make(),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => const UserProfil());
          },
          child: VxBox(
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ).color(Colors.white.withOpacity(0.5)).roundedFull.make(),
        ).pOnly(left: 16),
      ),
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
          VStack([
            SizedBox(height: Get.height / 5.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KategoriItem(
                  icon: Icons.map,
                  title: 'Lokasi Unit',
                  onTap: () {
                    Get.to(() => LokasiUnitPage());
                  },
                ),
                KategoriItem(
                  icon: Icons.event,
                  title: 'Event',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.person,
                  title: 'Profil',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.people,
                  title: 'Pengguna',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KategoriItem(
                  icon: Icons.place,
                  title: 'Kapanewon',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.place_outlined,
                  title: 'Kelurahan',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.school_outlined,
                  title: 'Data Ustadz',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.school,
                  title: 'Data Santri',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KategoriItem(
                  icon: Icons.image,
                  title: 'Galeri',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.message,
                  title: 'Pesan',
                  onTap: () {},
                ),
                KategoriItem(
                  icon: Icons.phone,
                  title: 'Kontak',
                  onTap: () {},
                ),
                const SizedBox(width: 50)
                // KategoriItem(
                //   icon: Icons.school,
                //   title: 'Data Santri',
                //   onTap: () {},
                // ),
              ],
            ),
            const SizedBox(height: 20),
            'Lokasi Unit'.text.xl.bold.make(),
            const SizedBox(height: 20),
            VxBox()
                .width(Get.width)
                .height(200)
                .bgImage(
                  const DecorationImage(
                    image: AssetImage('assets/map.jpeg'),
                    fit: BoxFit.cover,
                  ),
                )
                .rounded
                .make(),
          ]).p20().scrollVertical(),
          VxBox()
              .width(Get.width)
              .height(60)
              .color(Theme.of(context).primaryColor)
              .bottomRounded(value: 15)
              .make(),
          VStack([
            VxBox(
              child: HStack(
                [
                  VStack(
                    [
                      '15'.text.xl3.bold.make(),
                      'Pengguna'.text.base.make(),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  VStack(
                    [
                      '8'.text.xl3.bold.make(),
                      'Lokasi'.text.base.make(),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  VStack(
                    [
                      '7'.text.xl3.bold.make(),
                      'Ustadz'.text.base.make(),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ],
                alignment: MainAxisAlignment.spaceAround,
              ),
            )
                .width(Get.width)
                .height(100)
                .color(Colors.white)
                .rounded
                .outerShadowXl
                .make(),
            VxBox().width(Get.width).height(20).make(),
          ]).p16().scrollVertical(),
        ]),
      ),
    );
  }
}
