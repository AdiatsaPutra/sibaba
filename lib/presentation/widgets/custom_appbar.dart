import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/presentation/style.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double elevation;

  const CustomAppbar({Key? key, required this.title, this.elevation = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        title,
        style: whiteRegular,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
