import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/superadmin/profil_superadmin_page.dart.dart';
import 'package:sibaba/ui/widgets/dashboard_card.dart';

class HomeSuperadminPage extends StatelessWidget {
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
                        DashboardCard(
                          total: '30',
                          title: 'Pengguna',
                          color: Colors.blue,
                          onTap: () {},
                        ),
                        DashboardCard(
                          total: '300',
                          title: 'Lokasi',
                          color: Colors.orange,
                          onTap: () {},
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
