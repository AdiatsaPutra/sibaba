import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart';
import 'package:sibaba/infrastructures/extensions.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
          width: 200,
          height: 200,
        ).centered(),
        const SizedBox(height: 20),
        TabBar(
          tabs: [
            Tab(
              child: 'Sejarah'.text.lg.bold.make(),
            ),
            Tab(
              child: 'Struktur'.text.lg.bold.make(),
            ),
            Tab(
              child: 'Visi-misi'.text.lg.bold.make(),
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
                  tentang.profiles.struktur
                      .removeHTMLTag()
                      .text
                      .lg
                      .align(TextAlign.justify)
                      .make()
                      .p16()
                      .scrollVertical(),
                  tentang.profiles.visimisi
                      .removeHTMLTag()
                      .text
                      .lg
                      .align(TextAlign.justify)
                      .make()
                      .p16()
                      .scrollVertical(),
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
