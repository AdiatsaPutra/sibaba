import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDashboardInfo extends StatelessWidget {
  const AdminDashboardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VxBox(
        child: HStack(
          [
            VStack(
              [
                '15'.text.xl3.bold.make(),
                'Pengguna'.text.base.make(),
              ],
              crossAlignment: CrossAxisAlignment.center,
            ),
            VStack(
              [
                '8'.text.xl3.bold.make(),
                'Lokasi'.text.base.make(),
              ],
              crossAlignment: CrossAxisAlignment.center,
            ),
            VStack(
              [
                '7'.text.xl3.bold.make(),
                'Ustadz'.text.base.make(),
              ],
              crossAlignment: CrossAxisAlignment.center,
            ),
          ],
          alignment: MainAxisAlignment.spaceAround,
        ),
      )
          .width(Get.width)
          .height(100)
          .color(Colors.white)
          .rounded
          .outerShadowXl
          .make(),
      VxBox().width(Get.width).height(20).make(),
    ]).p16().scrollVertical();
  }
}
