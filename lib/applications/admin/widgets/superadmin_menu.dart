import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/data_santri_page.dart';
import 'package:sibaba/applications/admin/pages/data_unit_page.dart';
import 'package:sibaba/applications/admin/pages/data_ustadz_page.dart';
import 'package:sibaba/applications/admin/pages/gallery_page.dart';
import 'package:sibaba/applications/admin/pages/kapanewon_page.dart';
import 'package:sibaba/applications/admin/pages/kelurahan_page.dart';
import 'package:sibaba/applications/admin/pages/kontak_page.dart';
import 'package:sibaba/applications/admin/pages/pengguna_page.dart';
import 'package:sibaba/applications/admin/pages/pesan_page.dart';
import 'package:sibaba/applications/admin/pages/profil_website_page.dart';
import 'package:sibaba/applications/home/ui/ui.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'kategori_item.dart';

class SuperadminMenu extends StatelessWidget {
  final User user;
  const SuperadminMenu({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          KategoriItem(
            icon: Icons.map,
            title: 'Lokasi Unit\n',
            onTap: () {
              Get.to(() => LokasiUnitPage(user: user));
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
          KategoriItem(
            icon: Icons.place,
            title: 'Kapanewon\n',
            onTap: () {
              Get.to(() => const KapanewonPage());
            },
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          KategoriItem(
            icon: Icons.place_outlined,
            title: 'Kelurahan\n',
            onTap: () {
              Get.to(() => const KelurahanPage());
            },
          ),
          KategoriItem(
            icon: Icons.school_outlined,
            title: 'Data\nUstadz',
            onTap: () {
              Get.to(() => const DataUstadzPage());
            },
          ),
          KategoriItem(
            icon: Icons.school,
            title: 'Data\nSantri',
            onTap: () {
              Get.to(() => DataSantriPage(user: user));
            },
          ),
          KategoriItem(
            icon: Icons.image,
            title: 'Galeri\n',
            onTap: () {
              Get.to(() => GalleryPage(u: user));
            },
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          KategoriItem(
            icon: Icons.message,
            title: 'Pesan\n',
            onTap: () {
              Get.to(() => const PesanPage());
            },
          ),
          BlocBuilder<KontakKamiCubit, KontakKamiState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => KategoriItem(
                icon: Icons.phone,
                title: 'Kontak\n',
                onTap: () {
                  // Get.to(() => KontakPage(hariMasuk1: '', hariMasuk2: ''));
                },
              ),
              loaded: (kontakKami) => KategoriItem(
                icon: Icons.phone,
                title: 'Kontak\n',
                onTap: () {
                  Get.to(
                    () => KontakPage(
                      hariMasuk1: kontakKami.hari1 ?? 'senin',
                      hariMasuk2: kontakKami.hari2 ?? 'senin',
                    ),
                  );
                },
              ),
              orElse: () => KategoriItem(
                icon: Icons.phone,
                title: 'Kontak\n',
                onTap: () {
                  // Get.to(() => KontakPage(hariMasuk1: '', hariMasuk2: ''));
                },
              ),
            ),
          ),
          KategoriItem(
            icon: Icons.home,
            title: 'Kembali ke Home',
            onTap: () {
              Get.offAll(() => const HomePage());
            },
          ),
          const SizedBox(width: 65)
        ],
      ),
      const SizedBox(height: 20),
    ]);
  }
}
