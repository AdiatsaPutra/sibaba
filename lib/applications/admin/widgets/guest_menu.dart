import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GuestMenu extends StatelessWidget {
  const GuestMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VxBox(
        child: 'Akun anda belum terverifikasi.'.text.base.makeCentered(),
      )
          .width(Get.width)
          .height(50)
          .color(Colors.yellow)
          .rounded
          .outerShadowXl
          .make(),
      const SizedBox(height: 20),
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () {},
        child: 'Kirim permintaan menjadi admin'.text.base.make(),
      ),
    ]);
  }
}
