import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/detail_lokasi.dart';

class LokasiCard extends StatelessWidget {
  const LokasiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const DetailLokasiPage());
      },
      child: Container(
        padding: const EdgeInsets.all(defaultMargin),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 120.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TPA AN-NUUR',
                  style: darkRegular,
                ),
                Row(
                  children: [
                    Text(
                      'Akreditasi: ',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      'Belum Terakreditasi',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                    ),
                    Text(
                      'PENI, PALBAPANG',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.phone),
                    Text(
                      '1187618364734',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.mail),
                    Text(
                      'rrardian@hotmail.com',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      'Aktif',
                      style: darkRegular.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
