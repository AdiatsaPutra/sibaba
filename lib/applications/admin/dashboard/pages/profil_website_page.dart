import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilWebsitePage extends StatelessWidget {
  const ProfilWebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: 'Profil Website'.text.xl.color(Colors.white).make(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: const _ProfilWebsiteLayout());
  }
}

class _ProfilWebsiteLayout extends StatelessWidget {
  const _ProfilWebsiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VStack([
        const SizedBox(height: 10),
        'Sejarah Berdiri'.text.lg.make(),
        const SizedBox(height: 10),
        HtmlEditor(controller: HtmlEditorController()),
        const SizedBox(height: 10),
        'Struktur Organisasi'.text.lg.make(),
        const SizedBox(height: 10),
        HtmlEditor(controller: HtmlEditorController()),
        const SizedBox(height: 10),
        'Visi Misi'.text.lg.make(),
        const SizedBox(height: 10),
        HtmlEditor(controller: HtmlEditorController()),
      ]).p16().scrollVertical().expand(),
      HStack([
        ElevatedButton(
          onPressed: () {},
          child: 'Simpan'.text.base.make(),
        ).box.width(Get.width / 2.5).make(),
        const SizedBox().expand(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            Get.back();
          },
          child: 'Batal'.text.base.make(),
        ).box.width(Get.width / 2.5).make(),
      ]).p16()
    ]);
  }
}
