import 'package:flutter/material.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Gallery'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: VStack(
        [
          VStack([
            'Pilih Foto'.text.base.bold.make(),
            TextFormField(
              onTap: () {},
            ).stylized(hint: 'Pilih Foto').pOnly(bottom: 10),
          ]),
        ],
      ).centered().p16().scrollVertical(),
    );
  }
}
