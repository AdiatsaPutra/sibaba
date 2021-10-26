import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const CustomAppbar({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
