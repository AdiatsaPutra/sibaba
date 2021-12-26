import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibaba/presentation/style.dart';

class CategoryMenu extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final IconData? iconData;
  final Color? color;

  const CategoryMenu({
    Key? key,
    this.title,
    this.onTap,
    this.iconData,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: SizedBox(
                height: 140.h,
                width: 140.w,
                child: Icon(
                  iconData,
                  color: color,
                  size: 100.sp,
                ),
              ),
            ),
            Text(
              title!,
              style: darkRegular.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
