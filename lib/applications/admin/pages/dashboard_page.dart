import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/pages/user_profil.dart';
import 'package:sibaba/applications/admin/widgets/admin_dashboard_info.dart';
import 'package:sibaba/applications/admin/widgets/admin_menu.dart';
import 'package:sibaba/applications/admin/widgets/guest_menu.dart';
import 'package:sibaba/applications/admin/widgets/superadmin_menu.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';

import 'package:velocity_x/velocity_x.dart';

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
          VStack([
            ...context.read<LoginCubit>().user.roles.map(
                  (e) => e.name == 'superadmin'
                      ? SizedBox(height: Get.height / 5.7)
                      : const SizedBox(),
                ),
          ]),
          VStack([
            ...context.read<LoginCubit>().user.roles.map(
                  (e) => e.name == 'superadmin'
                      ? const SuperadminMenu()
                      : e.name == 'admin'
                          ? const AdminMenu()
                          : const GuestMenu(),
                ),
          ]),
          // 'Lokasi Unit'.text.xl.bold.make(),
          // const SizedBox(height: 20),
          // VxBox()
          //     .width(Get.width)
          //     .height(200)
          //     .bgImage(
          //       const DecorationImage(
          //         image: AssetImage('assets/map.jpeg'),
          //         fit: BoxFit.cover,
          //       ),
          //     )
          //     .rounded
          //     .make(),
        ]).p20().scrollVertical(),
        VStack([
          ...context.read<LoginCubit>().user.roles.map(
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
          ...context.read<LoginCubit>().user.roles.map(
                (e) => e.name == 'superadmin'
                    ? const AdminDashboardInfo()
                    : const SizedBox(),
              ),
        ]),
      ]),
    );
  }
}
