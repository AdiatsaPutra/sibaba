import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibaba/core/style.dart';

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
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
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
    );
  }
}
