import 'package:flutter/material.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Data Pesan'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: VStack(
        [
          VStack([
            ...List.generate(
              5,
              (index) => ExpansionTile(
                textColor: primaryColor,
                iconColor: primaryColor,
                title: 'Pesan'.text.base.bold.make(),
              )
                  .box
                  .color(Colors.white)
                  .rounded
                  .outerShadowXl
                  .make()
                  .pOnly(bottom: 10),
            )
          ]),
        ],
      ).centered().p16().scrollVertical(),
    );
  }
}
