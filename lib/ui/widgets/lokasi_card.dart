import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/detail_lokasi.dart';

class LokasiCard extends StatelessWidget {
  final String nama;
  final String alamat;
  final String akreditasi;
  final String telpUnit;
  final String email;
  final String status;
  final String? fotoPath;

  const LokasiCard(
      {Key? key,
      required this.nama,
      required this.alamat,
      required this.akreditasi,
      required this.telpUnit,
      required this.email,
      required this.status,
      this.fotoPath})
      : super(key: key);

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
        child: Column(
          children: [
            Container(
              height: 120.h,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  nama,
                  style: darkRegular,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'Akreditasi: ',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      akreditasi,
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alamat,
                            style: darkRegular.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(Icons.phone),
                    Text(
                      telpUnit,
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(Icons.mail),
                    Text(
                      email,
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: darkRegular.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      status,
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
