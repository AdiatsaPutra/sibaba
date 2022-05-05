import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../infrastructures/constant.dart';
import '../../../../infrastructures/refresh/cubit/refresh_cubit.dart';
import '../../../../injection.dart';
import '../../../../presentation/form_fields.dart';
import '../../../../presentation/loading_indicator.dart';
import '../../../../presentation/popup_messages.dart';
import '../../../../presentation/widgets/custom_appbar.dart';
import '../../../info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import '../../models/user.dart';

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

class _AddLokasiLayout extends StatefulWidget {
  final bool isEdit;
  final User user;
  const _AddLokasiLayout({Key? key, required this.isEdit, required this.user})
      : super(key: key);

  @override
  __AddLokasiLayoutState createState() => __AddLokasiLayoutState();
}

class __AddLokasiLayoutState extends State<_AddLokasiLayout> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InfoLokasiCubit>();
    final isLastStep = _currentStep == getSteps(cubit).length - 1;
    return Column(
      children: [
        Expanded(
          child: Form(
            key: cubit.key,
            child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return HStack([
                  OutlinedButton(
                    onPressed: () {
                      cancel();
                    },
                    child: 'Kembali'.text.base.make(),
                  ).expand(),
                  const SizedBox(width: 10),
                  Builder(
                    builder: (context) => isLastStep
                        ? BlocConsumer<InfoLokasiCubit, InfoLokasiState>(
                            listener: (context, state) => state.maybeWhen(
                              added: () {
                                Get.back();
                                PopupMessages.successPopup(
                                    'Berhasil menambahkan data lokasi');
                                context
                                    .read<RefreshCubit>()
                                    .refreshAdminLocation();
                              },
                              orElse: () {},
                            ),
                            builder: (context, state) => state.maybeWhen(
                              loading: () => ElevatedButton(
                                onPressed: null,
                                child: const CircularProgressIndicator()
                                    .centered(),
                              ),
                              orElse: () => ElevatedButton(
                                onPressed: () {
                                  // if (cubit.key.currentState!.validate()) {
                                  //   cubit.key.currentState!.save();
                                  cubit.addLokasi(widget.user.id.toString());
                                  // }
                                },
                                child: 'Simpan'.text.base.make(),
                              ),
                            ),
                          ).expand()
                        : ElevatedButton(
                            onPressed: () {
                              continued();
                            },
                            child: 'Lanjutkan'.text.base.make(),
                          ).expand(),
                  )
                ]).pOnly(top: 20);
              },
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              steps: getSteps(cubit),
            ),
          ),
        ),
      ],
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  List<Step> getSteps(InfoLokasiCubit cubit) => [
        Step(
          title: 'Isi Data TPA'.text.base.make(),
          content: VStack([
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
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: Text('Address'),
          content: VStack([
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
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: Text('Mobile Number'),
          content: VStack([
            const SizedBox(height: 10),
            'Deskripsi'.text.base.bold.make(),
            HtmlEditor(controller: cubit.deskripsi)
                .box
                .height(200)
                .make()
                .pOnly(bottom: 10),
            const SizedBox(height: 10),
            'Hari Masuk'.text.base.bold.make(),
            MultiSelectDialogField(
              items: listHari.map((e) => MultiSelectItem(e, e)).toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {},
              buttonIcon: null,
              searchHint: 'Pilih Hari Masuk',
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
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];
}
