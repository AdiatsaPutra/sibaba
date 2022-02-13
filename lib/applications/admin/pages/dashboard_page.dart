import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/widgets/kategori_item.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';

import 'package:sibaba/presentation/core.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

import 'data_santri_page.dart';
import 'data_unit_page.dart';
import 'data_ustadz_page.dart';
import 'event_page.dart';
import 'gallery_page.dart';
import 'kapanewon_page.dart';
import 'kelurahan_page.dart';
import 'kontak_page.dart';
import 'pengguna_page.dart';
import 'pesan_page.dart';
import 'profil_website_page.dart';
import 'user_profil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Selamat Datang, ${user.user.name}'
            .text
            .color(Colors.white)
            .xl
            .make(),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const UserProfil());
            },
            child: VxBox(
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
                .color(Colors.white.withOpacity(0.5))
                .width(30)
                .height(30)
                .roundedFull
                .make(),
          ).pOnly(right: 16),
        ],
      ),
      body: ZStack([
        VStack([
          SizedBox(height: Get.height / 5.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KategoriItem(
                icon: Icons.map,
                title: 'Lokasi Unit\n',
                onTap: () {
                  Get.to(() => LokasiUnitPage());
                },
              ),
              KategoriItem(
                icon: Icons.event,
                title: 'Event\n',
                onTap: () {
                  Get.to(() => const EventPage());
                },
              ),
              KategoriItem(
                icon: Icons.person,
                title: 'Profil\nWebsite',
                onTap: () {
                  Get.to(() => const ProfilWebsitePage());
                },
              ),
              KategoriItem(
                icon: Icons.people,
                title: 'Pengguna\n',
                onTap: () {
                  Get.to(() => const PenggunaPage());
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KategoriItem(
                icon: Icons.place,
                title: 'Kapanewon',
                onTap: () {
                  Get.to(() => const KapanewonPage());
                },
              ),
              KategoriItem(
                icon: Icons.place_outlined,
                title: 'Kelurahan',
                onTap: () {
                  Get.to(() => const KelurahanPage());
                },
              ),
              KategoriItem(
                icon: Icons.school_outlined,
                title: 'Data Ustadz',
                onTap: () {
                  Get.to(() => DataUstadzPage());
                },
              ),
              KategoriItem(
                icon: Icons.school,
                title: 'Data Santri',
                onTap: () {
                  Get.to(() => DataSantriPage());
                },
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
                onTap: () {
                  Get.to(() => const GalleryPage());
                },
              ),
              KategoriItem(
                icon: Icons.message,
                title: 'Pesan',
                onTap: () {
                  Get.to(() => const PesanPage());
                },
              ),
              KategoriItem(
                icon: Icons.phone,
                title: 'Kontak',
                onTap: () {
                  Get.to(() => const KontakPage());
                },
              ),
              const SizedBox(width: 50)
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
    );
  }
}
