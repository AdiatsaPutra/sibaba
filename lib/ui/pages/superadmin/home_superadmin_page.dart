import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/cubit/user_cubit.dart';
import 'package:sibaba/ui/pages/superadmin/pengguna_page.dart';
import 'package:sibaba/ui/pages/superadmin/profil_superadmin_page.dart.dart';
import 'package:sibaba/ui/widgets/dashboard_card.dart';
import 'package:sibaba/ui/widgets/dashboard_card_loading.dart';

class HomeSuperadminPage extends StatelessWidget {
  const HomeSuperadminPage({Key? key}) : super(key: key);

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
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dashboard Superadmin',
                          style: whiteRegular.copyWith(fontSize: 18.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => ProfilSuperadminPage());
                          },
                          child: Text(
                            'Profil',
                            style: whiteRegular.copyWith(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Selamat datang di Dasbor Superadmin TKA-TPA Kabupaten Bantul',
                      style: whiteRegular.copyWith(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            if (state is UserFetched) {
                              return DashboardCard(
                                total: state.userModel.length.toString(),
                                title: 'Pengguna',
                                color: Colors.blue,
                                onTap: () {
                                  Get.to(() => PenggunaPage());
                                },
                              );
                            } else {
                              return const DashboardCardLoading(
                                  color: Colors.blue);
                            }
                          },
                        ),
                        BlocBuilder<LokasiCubit, LokasiState>(
                          builder: (context, state) {
                            if (state is LokasiFetched) {
                              return DashboardCard(
                                total: state.lokasi.length.toString(),
                                title: 'Lokasi',
                                color: Colors.amber,
                                onTap: () {
                                  Get.to(() => PenggunaPage());
                                },
                              );
                            } else {
                              return const DashboardCardLoading(
                                  color: Colors.amber);
                            }
                          },
                        ),
                        DashboardCard(
                          total: '30',
                          title: 'Ustadz',
                          color: Colors.green,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Text(
                      'Lokasi Unit',
                      style: darkRegular,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Container(
                    //   height: 200.h,
                    //   width: Get.width.w,
                    //   padding: const EdgeInsets.all(13),
                    //   margin: const EdgeInsets.only(bottom: 10),
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           'https://i.stack.imgur.com/VSI2u.png'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    // ),
                    Text(
                      'Event',
                      style: darkRegular,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 200.h,
                      width: Get.width.w,
                      padding: const EdgeInsets.all(13),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                      ),
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
