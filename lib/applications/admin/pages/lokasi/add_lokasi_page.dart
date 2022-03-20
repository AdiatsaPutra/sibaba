import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class AddLokasiPage extends StatelessWidget {
  final bool isEdit;
  final String? slug;
  final User user;
  const AddLokasiPage(
      {Key? key, this.slug, required this.isEdit, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: isEdit == true ? 'Edit Lokasi' : 'Tambah Lokasi',
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) => isEdit == true
            ? BlocProvider(
                create: (context) =>
                    getIt<InfoLokasiCubit>()..getLocationDetail(slug!),
                child: BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
                  builder: (context, state) => state.maybeWhen(
                    loading: () => const LoadingIndicator(isScrollable: true),
                    detailLoaded: (location) {
                      context.read<InfoLokasiCubit>().init(l: location);
                      return _AddLokasiLayout(isEdit: isEdit, user: user);
                    },
                    orElse: () => const SizedBox(),
                  ),
                ),
              )
            : BlocProvider(
                create: (context) => getIt<InfoLokasiCubit>(),
                child: _AddLokasiLayout(isEdit: isEdit, user: user),
              ),
      ),
    );
  }
}

class _AddLokasiLayout extends StatelessWidget {
  final bool isEdit;
  final User user;
  const _AddLokasiLayout({Key? key, required this.isEdit, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InfoLokasiCubit>();
    return Form(
      key: cubit.key,
      child: VStack([
        VStack([
          'Input Data Unit'.text.xl.bold.make().pOnly(bottom: 10),
          'NSPQ'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.nspq,
            hint: 'NSPQ',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Nama'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.nama,
            hint: 'Nama',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Alamat'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.alamat,
            hint: 'Alamat',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Telepon'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.telepon,
            hint: 'Telepon',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'SK Pendirian'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.sk,
            hint: 'SK Pendirian',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Tempat Belajar'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.tempatBelajar,
            hint: 'Tempat Belajar',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Email'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.email,
            hint: 'Email',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Pilih Akreditasi'.text.base.bold.make(),
          DropdownButtonFormField<String>(
            hint: 'Pilih Akreditasi'.text.base.color(Colors.grey).make(),
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
            items: [
              ...akreditasi.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: e.text.base.make(),
                ),
              ),
            ],
            onChanged: (e) {
              cubit.setAkreditasi(e!);
            },
          ).pOnly(bottom: 10),
          const SizedBox(height: 10),
          'Tanggal Berdiri'.text.base.bold.make(),
          BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
            builder: (context, state) {
              return DateTimeField(
                decoration: const InputDecoration(
                  hintText: 'Tanggal Berdiri',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Wajib diisi';
                  }
                },
                onChanged: (value) {
                  cubit.setTanggalBerdiri(value!);
                },
                format: DateFormat('dd/MM/yyyy'),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
              );
            },
          ).pOnly(bottom: 10),
          const SizedBox(height: 10),
          'Direktur'.text.base.bold.make(),
          FormFields.textFormField(
            controller: cubit.direktur,
            hint: 'Direktur',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
          ),
          const SizedBox(height: 10),
          'Tanggal Akreditasi'.text.base.bold.make(),
          BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
            builder: (context, state) {
              return DateTimeField(
                decoration: const InputDecoration(
                  hintText: 'Tanggal Berdiri',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Wajib diisi';
                  }
                },
                onChanged: (value) {
                  cubit.setTanggalAkreditasi(value!);
                },
                format: DateFormat('dd/MM/yyyy'),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
              );
            },
          ).pOnly(bottom: 10),
          const SizedBox(height: 10),
          'Status'.text.base.bold.make(),
          DropdownButtonFormField<String>(
            hint: 'Status'.text.base.color(Colors.grey).make(),
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
            items: [
              ...status.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: e.text.base.make(),
                ),
              ),
            ],
            onChanged: (e) {
              cubit.setStatus(e!);
            },
          ).pOnly(bottom: 10),
          const SizedBox(height: 10),
          'Deskripsi'.text.base.bold.make(),
          HtmlEditor(controller: HtmlEditorController()).pOnly(bottom: 10),
          const SizedBox(height: 10),
          'Hari Masuk'.text.base.bold.make(),
          DropdownButtonFormField<String>(
            hint: 'Hari Masuk'.text.base.color(Colors.grey).make(),
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
            },
            items: [
              ...listHari.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: e.text.base.make(),
                ),
              ),
            ],
            onChanged: (e) {},
          ).pOnly(bottom: 10),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VStack([
                'Jam Masuk'.text.base.bold.make(),
                DateTimeField(
                  decoration: const InputDecoration(
                      hintText: 'Jam Masuk',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      )),
                  format: DateFormat('hh:mm'),
                  validator: (value) {
                    if (value == null) {
                      return 'Wajib diisi';
                    }
                  },
                  onChanged: (value) {
                    cubit.setJamMasuk(value!);
                  },
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
                  decoration: const InputDecoration(
                      hintText: 'Jam Keluar',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      )),
                  format: DateFormat('hh:mm'),
                  validator: (value) {
                    if (value == null) {
                      return 'Wajib diisi';
                    }
                  },
                  onChanged: (value) {
                    Logger().e(value);
                    cubit.setJamKeluar(value!);
                  },
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
        ]).p16().scrollVertical().expand(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: 'Batal'.text.base.color(Colors.grey).make(),
          ).expand(),
          const SizedBox(width: 10),
          BlocConsumer<InfoLokasiCubit, InfoLokasiState>(
            listener: (context, state) => state.maybeWhen(
              added: () {
                Get.back();
                PopupMessages.successPopup('Berhasil menambahkan data lokasi');
                context.read<RefreshCubit>().refreshAdminLocation();
              },
              orElse: () {},
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => ElevatedButton(
                onPressed: null,
                child: const CircularProgressIndicator().centered(),
              ),
              orElse: () => ElevatedButton(
                onPressed: () {
                  if (cubit.key.currentState!.validate()) {
                    cubit.key.currentState!.save();
                    cubit.addLokasi(user.id.toString());
                  }
                },
                child: 'Simpan'.text.base.make(),
              ),
            ),
          ).expand(),
        ]).p16()
      ]),
    );
  }
}
