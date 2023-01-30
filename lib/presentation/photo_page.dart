import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:velocity_x/velocity_x.dart';

class PhotoPage extends StatelessWidget {
  final String image;
  final bool isAsset;
  const PhotoPage({Key? key, required this.image, this.isAsset = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZStack([
      isAsset == false
          ? PhotoView(
              imageProvider: NetworkImage(image),
              enablePanAlways: true,
            )
          : PhotoView(
              imageProvider: AssetImage(image),
              enablePanAlways: true,
            ),
      VxBox(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ).pOnly(top: 10),
          ),
        ),
      )
          .width(Get.width)
          .height(65)
          .p16
          .color(const Color.fromARGB(255, 68, 68, 68).withOpacity(0.5))
          .make(),
    ]);
  }
}
