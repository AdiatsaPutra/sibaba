import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sibaba/applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart';
import 'package:sibaba/injection.dart';
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
      body: BlocProvider(
        create: (context) => getIt<TentangKamiCubit>()..getTentangkami(),
        child: const _ProfilWebsiteLayout(),
      ),
    );
  }
}

class _ProfilWebsiteLayout extends StatelessWidget {
  const _ProfilWebsiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TentangKamiCubit>();
    return VStack([
      BlocBuilder<TentangKamiCubit, TentangKamiState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const CircularProgressIndicator().centered(),
          loaded: (tentang) => VStack([
            const SizedBox(height: 10),
            'Sejarah Berdiri'.text.lg.make(),
            const SizedBox(height: 10),
            HtmlEditor(controller: cubit.sejarah),
            const SizedBox(height: 10),
            'Struktur Organisasi'.text.lg.make(),
            const SizedBox(height: 10),
            HtmlEditor(controller: cubit.struktur),
            const SizedBox(height: 10),
            'Visi Misi'.text.lg.make(),
            const SizedBox(height: 10),
            HtmlEditor(controller: cubit.visiMisi),
          ]),
          orElse: () => const SizedBox(),
        ),
      ).p16().scrollVertical().expand(),
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
