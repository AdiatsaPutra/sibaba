import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:intl/intl.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../kontak_kami/bloc/cubit/update_kontak_cubit.dart';

class KontakPage extends StatelessWidget {
  final String hariMasuk1;
  final String hariMasuk2;
  const KontakPage(
      {Key? key, required this.hariMasuk1, required this.hariMasuk2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<KontakKamiCubit>()..getKontakKami(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<UpdateKontakCubit>()..init(hariMasuk1, hariMasuk2),
        ),
      ],
      child: const _KontakLayout(),
    );
  }
}

class _KontakLayout extends StatelessWidget {
  const _KontakLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KontakKamiCubit>();
    final kontakCubit = context.read<UpdateKontakCubit>();
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
                key: kontakCubit.formKey,
                child: VStack([
                  VStack([
                    const SizedBox(height: 10),
                    'Alamat'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: kontakCubit.alamat..text = infoKontak.alamat,
                      minLines: 2,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    'Link Maps'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: kontakCubit.linkMaps
                        ..text = infoKontak.linkmaps,
                      minLines: 2,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Link Maps tidak boleh kosong';
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    'Telepon'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: kontakCubit.telepon..text = infoKontak.telpon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Telepon tidak boleh kosong';
                        }
                      },
                      formatter: [
                        LengthLimitingTextInputFormatter(13),
                      ],
                    ),
                    const SizedBox(height: 12),
                    'Email'.text.base.bold.make(),
                    FormFields.textFormField(
                      controller: kontakCubit.emailBadko
                        ..text = infoKontak.email!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!value.contains('@')) {
                          return 'Email tidak valid';
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    'Hari Masuk'.text.base.bold.make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<UpdateKontakCubit, UpdateKontakState>(
                          builder: (context, state) {
                            return DropdownButtonFormField<String>(
                              value: infoKontak.hari1 == null
                                  ? 'senin'
                                  : infoKontak.hari1!.toLowerCase(),
                              items: [
                                ...listHari.map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: e.text.base.make(),
                                  ),
                                ),
                              ],
                              onChanged: (e) {
                                kontakCubit.setHari1(e!);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Hari 1 tidak boleh kosong';
                                }
                              },
                            );
                          },
                        ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        'S/D'.text.base.make(),
                        BlocBuilder<UpdateKontakCubit, UpdateKontakState>(
                          builder: (context, state) {
                            return DropdownButtonFormField<String>(
                              value: infoKontak.hari2 == null
                                  ? 'senin'
                                  : infoKontak.hari2!.toLowerCase(),
                              items: [
                                ...listHari.map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: e.text.base.make(),
                                  ),
                                ),
                              ],
                              onChanged: (e) {
                                kontakCubit.setHari2(e!);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Hari 2 tidak boleh kosong';
                                }
                              },
                            );
                          },
                        ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VStack([
                          'Jam Masuk'.text.base.bold.make(),
                          DateTimeField(
                            controller: kontakCubit.jamMasuk
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
                            validator: (value) {
                              if (kontakCubit.jamMasuk.text.isEmpty) {
                                return 'Jam Masuk tidak boleh kosong';
                              }
                            },
                          ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        ]),
                        VStack([
                          'Jam Keluar'.text.base.bold.make(),
                          DateTimeField(
                            controller: kontakCubit.jamKeluar
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
                            validator: (value) {
                              if (kontakCubit.jamKeluar.text.isEmpty) {
                                return 'Jam Keluar tidak boleh kosong';
                              }
                            },
                          ).box.width(Get.width / 2.5).make().pOnly(bottom: 10),
                        ]),
                      ],
                    )
                  ]),
                  const SizedBox(height: 10),
                  BlocListener<UpdateKontakCubit, UpdateKontakState>(
                    listener: (context, state) => state.maybeWhen(
                      success: () {
                        cubit.getKontakKami();
                        PopupMessages.successPopup(
                          'Berhasil mengupdate data kontak',
                        );
                      },
                      orElse: () {},
                    ),
                    child: BlocBuilder<UpdateKontakCubit, UpdateKontakState>(
                      builder: (context, state) => state.maybeWhen(
                        loading: () => ElevatedButton(
                          onPressed: null,
                          child: const CircularProgressIndicator().centered(),
                        ),
                        orElse: () => ElevatedButton(
                          onPressed: () {
                            if (kontakCubit.formKey.currentState!.validate()) {
                              kontakCubit.formKey.currentState!.save();
                              kontakCubit.updateKontak();
                            }
                          },
                          child: 'Simpan'.text.base.make(),
                        ).wFull(context).h(50),
                      ),
                    ),
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
