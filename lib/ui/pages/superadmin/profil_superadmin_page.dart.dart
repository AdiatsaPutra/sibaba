import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class ProfilSuperadminPage extends StatelessWidget {
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Profil',
                      style: darkRegular.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  label: 'Nama',
                  hintText: 'Nama',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Email',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Password',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Konfirmasi Password',
                  hintText: 'Konfirmasi Password',
                  isPassword: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                      style: whiteRegular,
                    ),
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
