import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/pages/sign_up_page.dart';
import 'package:sibaba/ui/pages/superadmin/dasboard_superadmin.dart';
import 'package:sibaba/ui/widgets/custom_login_textfield.dart';

class SignInPage extends StatelessWidget {
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
                Center(
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Masukkan Email',
                ),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Masukkan Password',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => DashboardSuperadmin());
                    },
                    child: Text(
                      'Masuk',
                      style: whiteRegular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => SignUpPage());
                    },
                    child: Text(
                      'Daftar Pengguna Baru',
                      style: darkRegular.copyWith(color: primaryColor),
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
