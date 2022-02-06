import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:sibaba/presentation/widgets/sibaba_textfield.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<KontakKamiCubit>()..getKontakKami(),
      child: const _KontakLayout(),
    );
  }
}

class _KontakLayout extends StatelessWidget {
  const _KontakLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KontakKamiCubit>();
    return Scaffold(
      appBar: AppBar(
        title: 'Data Kontak'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<KontakKamiCubit, KontakKamiState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const CircularProgressIndicator().centered(),
          loaded: (infoKontak) => VStack(
            [
              Form(
                child: VStack([
                  VStack([
                    const SizedBox(height: 10),
                    'Alamat'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: cubit.alamat..text = infoKontak.alamat,
                      minLines: 2,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 12),
                    'Link Maps'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: cubit.linkMaps..text = infoKontak.linkmaps,
                      minLines: 2,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 12),
                    'Telepon'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: cubit.telepon..text = infoKontak.telpon,
                    ),
                    const SizedBox(height: 12),
                    'Hari Masuk'.text.base.bold.make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonFormField<String>(
                          value: infoKontak.hari1,
                          items: [
                            ...listHari.map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: e.text.base.make(),
                              ),
                            ),
                          ],
                          onChanged: (e) {},
                        ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        'S/D'.text.base.make(),
                        DropdownButtonFormField<String>(
                          value: infoKontak.hari2,
                          items: [
                            ...listHari.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: e.text.base.make(),
                              ),
                            ),
                          ],
                          onChanged: (e) {},
                        ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VStack([
                          'Jam Masuk'.text.base.bold.make(),
                          DateTimeField(
                            controller: cubit.jamMasuk
                              ..text = infoKontak.formattedJamMasuk,
                            decoration: const InputDecoration(
                                hintText: 'Jam Masuk',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                )),
                            format: DateFormat('hh:mm'),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.convert(time);
                            },
                          ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        ]),
                        VStack([
                          'Jam Keluar'.text.base.bold.make(),
                          DateTimeField(
                            controller: cubit.jamKeluar
                              ..text = infoKontak.formattedJamKeluar,
                            decoration: const InputDecoration(
                                hintText: 'Jam Masuk',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                )),
                            format: DateFormat('hh:mm'),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.convert(time);
                            },
                          ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        ]),
                      ],
                    )
                  ]),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: 'Simpan'.text.base.make(),
                  ),
                ]),
              ),
            ],
          ),
          orElse: () => const SizedBox(),
        ),
      ).centered().p16().scrollVertical(),
    );
  }
}
