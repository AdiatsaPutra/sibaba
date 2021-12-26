import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Kontak Kami'),
      body: BlocProvider(
        create: (context) => getIt<KontakKamiCubit>()..getKontakKami(),
        child: const _KontakKamiLayout(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            builder: (context) {
              return VStack([
                VxBox()
                    .width(100)
                    .height(3)
                    .color(Colors.grey)
                    .rounded
                    .makeCentered()
                    .p16(),
                'Kontak Kami'
                    .text
                    .xl
                    .bold
                    .color(Theme.of(context).primaryColor)
                    .makeCentered(),
              ]).box.height(Get.height).make();
            },
          );
        },
        label:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(
            Icons.message,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          'Kirim Pesan'.text.lg.bold.color(Colors.white).make(),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _KontakKamiLayout extends StatelessWidget {
  const _KontakKamiLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VxBox()
          .width(Get.width)
          .height(Get.height / 2.5)
          .color(Colors.red)
          .make(),
      VxBox(
        child: BlocBuilder<KontakKamiCubit, KontakKamiState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
            loaded: (infoKontak) => VStack([
              'Kontak Kami'.text.xl.bold.make(),
              const SizedBox(height: 10),
              'Alamat: ${infoKontak.alamat}'.text.lg.make(),
              const SizedBox(height: 10),
              'Telepon: ${infoKontak.telpon}'.text.lg.make(),
              const SizedBox(height: 10),
              'Email: ${infoKontak.email}'.text.lg.make(),
              const SizedBox(height: 10),
              HStack([
                infoKontak.masukJam.substring(0, 5).text.base.make(),
                ' S/D '.text.base.make(),
                infoKontak.selesaiJam.substring(0, 5).text.base.make(),
              ])
            ]),
            orElse: () => const SizedBox(),
          ),
        ),
      ).width(Get.width).p16.make(),
    ]);
  }
}
