import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/user_profil.dart';
import 'package:sibaba/applications/admin/widgets/admin_dashboard_info.dart';
import 'package:sibaba/applications/admin/widgets/admin_menu.dart';
import 'package:sibaba/applications/admin/widgets/guest_menu.dart';
import 'package:sibaba/applications/admin/widgets/superadmin_menu.dart';

import 'package:velocity_x/velocity_x.dart';

class DashboardPage extends StatelessWidget {
  final User user;

  const DashboardPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            'Selamat Datang, ${user.name}'.text.color(Colors.white).xl.make(),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => UserProfilPage(user: user));
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
          VStack([
            ...user.roles.map(
              (e) => e.name == 'superadmin'
                  ? SizedBox(height: Get.height / 5.7)
                  : const SizedBox(),
            ),
          ]),
          VStack([
            ...user.roles.map(
              (e) => e.name == 'superadmin'
                  ? SuperadminMenu(user: user)
                  : e.name == 'admin'
                      ? AdminMenu(user: user)
                      : const GuestMenu(),
            ),
          ]),
        ]).p20().scrollVertical(),
        VStack([
          ...user.roles.map(
            (e) => e.name == 'superadmin'
                ? VxBox()
                    .width(Get.width)
                    .height(60)
                    .color(Theme.of(context).primaryColor)
                    .bottomRounded(value: 15)
                    .make()
                : const SizedBox(),
          ),
        ]),
        VStack([
          ...user.roles.map(
            (e) => e.name == 'superadmin'
                ? const AdminDashboardInfo()
                : const SizedBox(),
          ),
        ]),
      ]),
    );
  }
}
