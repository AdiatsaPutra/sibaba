import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/presentation/style.dart';

class DashboardCard extends StatelessWidget {
  final String? total;
  final String? title;
  final Color? color;
  final VoidCallback? onTap;

  const DashboardCard({
    Key? key,
    required this.total,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        width: Get.width.w / 4,
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  total!,
                  style: whiteRegular.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  title!,
                  style: whiteRegular.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              'Lihat Detail',
              style: whiteSmall.copyWith(fontSize: 13.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
