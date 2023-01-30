import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class GuestMenu extends StatelessWidget {
  final String name;
  const GuestMenu({Key? key, required this.name}) : super(key: key);

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
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () {
          var sendText =
              'Halo admin Badko Bantul, saya $name ingin menjadi admin';
          launch('http://wa.me/6285323017774?text=$sendText');
        },
        child: 'Kirim permintaan menjadi admin'.text.base.make(),
      ),
    ]);
  }
}
