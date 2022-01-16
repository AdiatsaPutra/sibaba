import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/dashboard/widgets/kategori_item.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZStack([
        VxBox()
            .width(Get.width)
            .height(200)
            .color(Theme.of(context).primaryColor)
            .bottomRounded(value: 15)
            .make(),
        VStack([
          const SizedBox(height: 30),
          'Selamat Datang di Dashboard Superadmin TKA-TPA Kabupaten Bantul'
              .text
              .xl
              .bold
              .color(Colors.white)
              .make(),
          const SizedBox(height: 20),
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
              .height(130)
              .color(Colors.white)
              .rounded
              .outerShadowXl
              .make(),
          VxBox().width(Get.width).height(20).make(),
        ]).p16().scrollVertical(),
        VStack([
          SizedBox(height: Get.height / 2.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KategoriItem(
                icon: Icons.map,
                title: 'Lokasi Unit',
                onTap: () {},
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
        ]).p16()
      ]),
    );
  }
}
