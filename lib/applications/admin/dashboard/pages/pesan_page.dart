import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<KontakKamiCubit>()..getMessage(),
      child: const _PesanLayout(),
    );
  }
}

class _PesanLayout extends StatelessWidget {
  const _PesanLayout({Key? key}) : super(key: key);

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
          BlocBuilder<KontakKamiCubit, KontakKamiState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircularProgressIndicator().centered(),
              error: (m) => m.text.base.makeCentered(),
              messageLoaded: (m) => VStack([
                ...m.map(
                  (e) => ExpansionTile(
                    textColor: primaryColor,
                    iconColor: primaryColor,
                    title: e.fullname.text.base.bold.make(),
                    childrenPadding: const EdgeInsets.all(16),
                    children: [
                      e.message.text.base.make(),
                    ],
                  )
                      .box
                      .color(Colors.white)
                      .rounded
                      .outerShadowXl
                      .make()
                      .pOnly(bottom: 10),
                )
              ]),
              orElse: () => const SizedBox(),
            ),
          )
        ],
      ).centered().p16().scrollVertical(),
    );
  }
}
