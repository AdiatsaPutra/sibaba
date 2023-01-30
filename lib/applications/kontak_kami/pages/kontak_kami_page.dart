import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/minimap.dart';
import 'package:sibaba/presentation/success_dialog.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
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
        backgroundColor: primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            isScrollControlled: true,
            builder: (context) {
              return VxBox(
                child: BlocProvider(
                  create: (context) => getIt<KontakKamiCubit>(),
                  child: Builder(
                    builder: (context) {
                      return Form(
                        key: context.read<KontakKamiCubit>().formKey,
                        child: VStack([
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
                              .make(),
                          const SizedBox(height: 10),
                          'Nama Lengkap'.text.base.bold.make(),
                          TextFormField(
                            controller:
                                context.read<KontakKamiCubit>().fullName,
                            decoration: const InputDecoration(
                                hintText: 'Masukkan Nama Lengkap'),
                            validator: (value) {
                              if (value == "") {
                                return 'Masukkan Nama Lengkap';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          'Nomor Telepon'.text.base.bold.make(),
                          TextFormField(
                            controller: context.read<KontakKamiCubit>().phone,
                            decoration: const InputDecoration(
                                hintText: 'Masukkan Nomor Telepon'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == "") {
                                return 'Masukkan Nomor Telepon';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          'Email'.text.base.bold.make(),
                          TextFormField(
                            controller: context.read<KontakKamiCubit>().email,
                            decoration: const InputDecoration(
                                hintText: 'Masukkan Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == "") {
                                return 'Masukkan Email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          'Pesan'.text.base.bold.make(),
                          TextFormField(
                            controller: context.read<KontakKamiCubit>().message,
                            decoration: const InputDecoration(
                                hintText: 'Masukkan Pesan'),
                            validator: (value) {
                              if (value == "") {
                                return 'Masukkan Pesan';
                              }
                              return null;
                            },
                            minLines: 2,
                            maxLines: 4,
                          ),
                          const SizedBox(height: 10),
                          BlocConsumer<KontakKamiCubit, KontakKamiState>(
                            listener: (context, state) => state.maybeWhen(
                              messageSend: () {
                                VxDialog.showCustom(
                                  context,
                                  child: const SuccessDialog(
                                    image: 'assets/sent.png',
                                    message: 'Pesan berhasil dikirim',
                                  ),
                                );
                                return null;
                              },
                              orElse: () {
                                return null;
                              },
                            ),
                            builder: (context, state) => state.maybeWhen(
                              loading: () => ElevatedButton(
                                onPressed: null,
                                child: const CircularProgressIndicator()
                                    .centered()
                                    .h24(context),
                              ),
                              orElse: () => ElevatedButton(
                                onPressed: () {
                                  if (context
                                      .read<KontakKamiCubit>()
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    context
                                        .read<KontakKamiCubit>()
                                        .formKey
                                        .currentState!
                                        .save();
                                    FocusScope.of(context).unfocus();
                                    context
                                        .read<KontakKamiCubit>()
                                        .sendMessage();
                                  }
                                },
                                child: 'Kirim'
                                    .text
                                    .color(Colors.white)
                                    .base
                                    .make(),
                              ),
                            ),
                          )
                        ]).p16(),
                      );
                    },
                  ),
                ).box.height(Get.height).make(),
              ).height(Get.height / 1.1).make();
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
      VxBox(
        child: BlocBuilder<KontakKamiCubit, KontakKamiState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const LoadingIndicator(),
            loaded: (infoKontak) => VStack([
              const SizedBox(height: 10),
              HStack([
                'Peta Lokasi'.text.xl.bold.make().expand(),
                GestureDetector(
                  onTap: () async {
                    String googleUrl =
                        'https://www.google.com/maps/search/?api=1&query=${-7.887392001723083},${110.33191832274352}';
                    if (await launchUrl(Uri.parse(googleUrl))) {
                    } else {
                      throw 'Could not open the map.';
                    }
                  },
                  child: 'Buka Di Map'.text.xl.make(),
                ),
              ]),
              const Minimap(
                latLng: LatLng(-7.887392001723083, 110.33191832274352),
              ),
              const SizedBox(height: 10),
              'Kontak Kami'.text.xl.bold.make(),
              const SizedBox(height: 10),
              'Alamat: ${infoKontak.alamat}'.text.lg.make(),
              const SizedBox(height: 10),
              'Telepon: ${infoKontak.telpon}'.text.lg.make(),
              const SizedBox(height: 10),
              'Email: ${infoKontak.email}'.text.lg.make(),
              const SizedBox(height: 10),
              HStack([
                infoKontak.hari1 == null
                    ? '-'.text.lg.make()
                    : infoKontak.hari1!.text.lg.make(),
                ' S/D '.text.lg.make(),
                infoKontak.hari2 == null
                    ? '-'.text.lg.make()
                    : infoKontak.hari2!.text.lg.make(),
                // infoKontak.hari2!.text.lg.make(),
              ]),
              const SizedBox(height: 10),
              HStack([
                infoKontak.masukJam.substring(0, 5).text.lg.make(),
                ' S/D '.text.lg.make(),
                infoKontak.selesaiJam.substring(0, 5).text.lg.make(),
              ])
            ]),
            orElse: () => const SizedBox(),
          ),
        ),
      )
          .width(Get.width)
          .color(Colors.white)
          .rounded
          .outerShadowXl
          .p16
          .make()
          .p16(),
    ]);
  }
}
