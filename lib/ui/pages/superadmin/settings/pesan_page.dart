import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/pesan_tile.dart';

class PesanPage extends StatelessWidget {
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
                      'Pesan',
                      style: darkRegular.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
                PesanTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
