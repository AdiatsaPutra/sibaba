import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color? color;
  final double elevation;

  const CustomAppbar({Key? key, this.title, this.color, this.elevation = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.blue,
      elevation: elevation,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(
        title!,
        style: whiteRegular,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
