import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/data_santri_page.dart';
import 'package:sibaba/applications/admin/pages/data_unit_page.dart';
import 'package:sibaba/applications/admin/pages/data_ustadz_page.dart';
import 'package:sibaba/applications/admin/pages/event_page.dart';
import 'package:sibaba/applications/admin/pages/gallery_page.dart';
import 'package:sibaba/applications/admin/pages/kapanewon_page.dart';
import 'package:sibaba/applications/admin/pages/kelurahan_page.dart';
import 'package:sibaba/applications/admin/pages/kontak_page.dart';
import 'package:sibaba/applications/admin/pages/pengguna_page.dart';
import 'package:sibaba/applications/admin/pages/pesan_page.dart';
import 'package:sibaba/applications/admin/pages/profil_website_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'kategori_item.dart';

class AdminMenu extends StatelessWidget {
  final User user;
  const AdminMenu({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          KategoriItem(
            icon: Icons.map,
            title: 'Lokasi Unit',
            onTap: () {
              Get.to(() => LokasiUnitPage(
                    user: user,
                  ));
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
          KategoriItem(
            icon: Icons.image,
            title: 'Galeri',
            onTap: () {
              Get.to(() => const GalleryPage());
            },
          ),
        ],
      ),
      const SizedBox(height: 20),
    ]);
  }
}
