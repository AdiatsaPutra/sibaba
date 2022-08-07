import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart';
import 'package:sibaba/infrastructures/extensions.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/photo_page.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Tentang Kami'),
        body: BlocProvider(
          create: (context) => getIt<TentangKamiCubit>()..getTentangkami(),
          child: const _TentangKamiLayout(),
        ),
      ),
    );
  }
}

class _TentangKamiLayout extends StatelessWidget {
  const _TentangKamiLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        const SizedBox(height: 20),
        Image.asset(
          'assets/logo.png',
          width: 100,
          height: 100,
        ).centered(),
        const SizedBox(height: 20),
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: 'Sejarah'.text.size(12).bold.make(),
            ),
            Tab(
              child: 'Struktur'.text.size(12).bold.make(),
            ),
            Tab(
              child: 'Visi-misi'.text.size(12).bold.make(),
            ),
            Tab(
              child: 'Gallery'.text.size(12).bold.make(),
            ),
          ],
        ).p16(),
        BlocBuilder<TentangKamiCubit, TentangKamiState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const LoadingIndicator(),
            loaded: (tentang) => Expanded(
              child: TabBarView(
                children: [
                  tentang.profiles.sejarah
                      .removeHTMLTag()
                      .text
                      .lg
                      .align(TextAlign.justify)
                      .make()
                      .p16()
                      .scrollVertical(),
                  VStack([
                    'Klik untuk memperbesar'.text.base.make(),
                    GestureDetector(
                      onTap: () => Get.to(
                        const PhotoPage(
                          image: 'assets/struktur.jpeg',
                          isAsset: true,
                        ),
                      ),
                      child: Image.asset('assets/struktur.jpeg'),
                    )
                  ]).scrollVertical(),
                  tentang.profiles.visimisi
                      .removeHTMLTag()
                      .text
                      .lg
                      .align(TextAlign.justify)
                      .make()
                      .p16()
                      .scrollVertical(),
                  VStack([
                    'Klik untuk memperbesar'.text.base.make(),
                    VStack([
                      ...tentang.gallery.map(
                        (e) => GestureDetector(
                          onTap: () {
                            Get.to(
                              PhotoPage(
                                  image:
                                      'https://badkobantul.tatiumy.com/storage/fileGallery/${e.file}'),
                            );
                          },
                          child: VxBox()
                              .width(Get.width)
                              .height(200)
                              .bgImage(DecorationImage(
                                  image: NetworkImage(
                                      'https://badkobantul.tatiumy.com/storage/fileGallery/${e.file}'),
                                  fit: BoxFit.cover))
                              .roundedSM
                              .make()
                              .pOnly(bottom: 10),
                        ),
                      ),
                    ]).scrollVertical().expand(),
                  ]).p16()
                ],
              ),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ],
    );
  }
}
