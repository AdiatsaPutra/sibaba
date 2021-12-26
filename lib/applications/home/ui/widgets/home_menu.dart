import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeMenu extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const HomeMenu(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VxBox(
        child: HStack([
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ).p12(),
          title.text.xl.bold.make()
        ]),
      )
          .color(Colors.white)
          .height(120)
          .width(Get.width)
          .rounded
          .outerShadowXl
          .margin(const EdgeInsets.only(bottom: 20))
          .make(),
    );
  }
}
