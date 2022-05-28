import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeMenu extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double width;

  const HomeMenu({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: width,
      ).box.makeCentered(),
    );
  }
}
