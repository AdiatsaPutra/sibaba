import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/custom_login_textfield.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({Key? key}) : super(key: key);

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
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25.sp,
                  ),
                ),
                Container(
                  height: 140.h,
                  width: Get.width.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('https://i.stack.imgur.com/VSI2u.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Kontak',
                      style: darkRegular,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                        ),
                        Text(
                          'PENI, PALBAPANG',
                          style: darkRegular.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        Text(
                          '1187618364734',
                          style: darkRegular.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.mail),
                        Text(
                          'rrardian@hotmail.com',
                          style: darkRegular.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Text(
                      'Waktu Operasional',
                      style: darkRegular.copyWith(fontSize: 16.sp),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.date_range_rounded),
                        Row(
                          children: [
                            Text(
                              '08:00',
                              style: darkRegular.copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              ' S/D ',
                              style: darkRegular.copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              '15:00',
                              style: darkRegular.copyWith(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  label: 'Nama',
                  hintText: 'Masukkan Nama Anda',
                ),
                CustomTextField(
                  label: 'Nomor Telpon',
                  hintText: 'Nomor Telpon',
                ),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Masukkan Email',
                ),
                CustomTextField(
                  label: 'Pesan',
                  hintText: '',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      style: whiteRegular,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
