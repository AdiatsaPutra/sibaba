import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';

class CategoryTile extends StatelessWidget {
  final Color? color;
  final String? title;
  final IconData? icon;
  final VoidCallback? onTap;

  const CategoryTile({Key? key, this.color, this.title, this.icon, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 80.h,
            width: Get.width.w,
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 60,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    Container(
                      height: 40.h,
                      width: 1.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      title!,
                      style: whiteRegular.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
