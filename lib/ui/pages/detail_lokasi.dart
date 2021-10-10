import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';

class DetailLokasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 140.h,
                  width: Get.width.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'NSPQ',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '411234020080',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Direktur',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          'RAIS RAHMAN ARDIAN',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Email',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          'rrardian@hotmail.com',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Nomor Telepon',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '09768367434',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Tempat Belajar',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          'TPA',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Tanggal Berdiri',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '31-01-2000',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'SK Pendirian',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          'kd.12.01/03/0080/2015',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Tanggal Akreditasi',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '01-01-1970',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Hari masuk',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          'Senin, Selasa, Rabu, Kamis, Jumat, Sabtu',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Jam masuk',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '15:00',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Jam selesai',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                        Text(
                          '18:30',
                          style: darkRegular.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Deskripsi:',
                  style: darkRegular.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'TPA AN-NUUR Peni, Bantul, Tajeman, Palbapang, Kec. Bantul, Bantul, Daerah Istimewa Yogyakarta 55713',
                  style: darkRegular.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
