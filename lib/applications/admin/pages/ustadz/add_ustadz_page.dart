import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/models/ustadz_detail.dart';
import 'package:sibaba/applications/admin/widgets/ustadz/ustadz_pelatihan_form.dart';
import 'package:sibaba/applications/admin/widgets/ustadz/ustadz_pendidikan_formal_form.dart';
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart';
import 'package:sibaba/infrastructures/constant.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/generic_selector.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../infrastructures/generic.dart';
import '../../../../presentation/form_fields.dart';
import '../../../info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import '../../bloc/add_ustadz/add_ustadz_cubit.dart';
import '../../bloc/image_handler/image_handler_cubit.dart';
import '../../bloc/ustadz/ustadz_cubit.dart';

class AddUstadzPage extends StatelessWidget {
  final bool isEdit;
  final int? ustadzId;
  const AddUstadzPage({Key? key, this.isEdit = false, this.ustadzId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Tambah Data Ustadz',
      ),
      body: MultiBlocProvider(
        providers: [
          isEdit
              ? BlocProvider(
                  create: (context) =>
                      getIt<UstadzCubit>()..getDetailUstadzs(ustadzId!),
                )
              : BlocProvider(
                  create: (context) => getIt<UstadzCubit>(),
                ),
          BlocProvider(
            create: (context) => getIt<InfoLokasiCubit>()..getLokasi(),
          ),
          BlocProvider(
            create: (context) => getIt<AddUstadzCubit>(),
          ),
          BlocProvider(
            create: (context) => ImageHandlerCubit(),
          ),
        ],
        child: isEdit
            ? BlocBuilder<UstadzCubit, UstadzState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => const CircularProgressIndicator().centered(),
                  detailLoaded: (detail) => _AddUstadzLayout(
                    detailUstadz: detail,
                  ),
                  orElse: () => const SizedBox(),
                ),
              )
            : const _AddUstadzLayout(),
      ),
    );
  }
}

class _AddUstadzLayout extends StatefulWidget {
  final DetailUstadz? detailUstadz;
  const _AddUstadzLayout({Key? key, this.detailUstadz}) : super(key: key);

  @override
  State<_AddUstadzLayout> createState() => _AddUstadzLayoutState();
}

class _AddUstadzLayoutState extends State<_AddUstadzLayout> {
  @override
  initState() {
    super.initState();
    widget.detailUstadz == null
        ? null
        : BlocProvider.of<AddUstadzCubit>(context).init(widget.detailUstadz!);
  }

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddUstadzCubit>();
    final imageHandler = context.read<ImageHandlerCubit>();
    final isLastStep = _currentStep == 3;
    Logger().i(isLastStep);
    return Column(
      children: [
        Expanded(
          child: Form(
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
                        ? BlocConsumer<AddUstadzCubit, AddUstadzState>(
                            listener: (context, state) => state.maybeWhen(
                              success: () {
                                Navigator.pop(context);
                                context.read<RefreshCubit>().refreshUstadz();
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
                                    .centered(),
                              ),
                              orElse: () => ElevatedButton(
                                onPressed: () {
                                  cubit.addUstadz(
                                    imageHandler.image!,
                                    context.read<LoginCubit>().user.id,
                                  );
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
              steps: getSteps(cubit, imageHandler),
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
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  List<Step> getSteps(AddUstadzCubit cubit, ImageHandlerCubit imageHandler) => [
        Step(
          title: 'Step 1'.text.base.make(),
          content: VStack([
            'Identitas'.text.lg.bold.make(),
            const SizedBox(height: 10),
            'Lokasi'.text.base.bold.make(),
            BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => FormFields.textFormField(
                  controller: TextEditingController(),
                  hint: 'Loading',
                  readOnly: true,
                ),
                loaded: (locations) => FormFields.textFormField(
                  controller: cubit.lokasi,
                  hint: 'Alamat',
                  validator: (value) {
                    if (value == "") {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                  onTap: () async {
                    final res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenericSelector(
                          genericList: [
                            ...locations.lokasi.map(
                              (location) => Generic(
                                location.locationId!,
                                location.nama!,
                              ),
                            ),
                          ],
                          title: 'Pilih Lokasi Unit',
                        ),
                      ),
                    );
                    if (res is Generic) {
                      cubit.setLokasi(res.title);
                    }
                  },
                  readOnly: true,
                ),
                orElse: () => FormFields.textFormField(
                  controller: TextEditingController(),
                  hint: 'Alamat',
                  readOnly: true,
                ),
              ),
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
                return null;
              },
            ),
            const SizedBox(height: 10),
            'Jenis Kelamin'.text.base.bold.make(),
            BlocBuilder<AddUstadzCubit, AddUstadzState>(
              builder: (context, state) {
                return DropdownButtonFormField<String>(
                  value:
                      widget.detailUstadz == null ? null : cubit.jenisKelamin,
                  hint: 'Jenis Kelamin'.text.base.color(Colors.grey).make(),
                  validator: (value) {
                    if (value == "") {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                  items: [
                    ...jenisKelamin.map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: e.text.base.make(),
                      ),
                    ),
                  ],
                  onChanged: (e) {
                    cubit.setjenisKelamin(e!);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            'Tempat Lahir'.text.base.bold.make(),
            FormFields.textFormField(
              controller: cubit.tempatLahir,
              hint: 'Tempat Lahir',
              validator: (value) {
                if (value == "") {
                  return 'Wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            'Tanggal Lahir'.text.base.bold.make(),
            BlocBuilder<AddUstadzCubit, AddUstadzState>(
              builder: (context, state) {
                return DateTimeField(
                  initialValue: widget.detailUstadz == null
                      ? null
                      : DateTime.parse(cubit.tanggalLahir),
                  decoration: const InputDecoration(
                    hintText: 'Tanggal Lahir',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    cubit.setTanggalLahir(value!);
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
            ),
            const SizedBox(height: 10),
            'Alamat Lengkap'.text.base.bold.make(),
            FormFields.textFormField(
              controller: cubit.alamatLengkap,
              hint: 'Alamat Lengkap',
              validator: (value) {
                if (value == "") {
                  return 'Wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            'No HP'.text.base.bold.make(),
            FormFields.textFormField(
                controller: cubit.noHp,
                hint: 'No HP',
                validator: (value) {
                  if (value == "") {
                    return 'Wajib diisi';
                  }
                  return null;
                },
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            'Email'.text.base.bold.make(),
            FormFields.textFormField(
              controller: cubit.email,
              hint: 'Email',
              validator: (value) {
                if (value == "") {
                  return 'Wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            'Mulai Mengajar'.text.base.bold.make(),
            FormFields.textFormField(
              controller: cubit.mulaiMengajar,
              hint: 'Mulai Mengajar',
              validator: (value) {
                if (value == "") {
                  return 'Wajib diisi';
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            'Status'.text.base.bold.make(),
            DropdownButtonFormField<String>(
              value: widget.detailUstadz == null ? null : cubit.status,
              hint: 'Status'.text.base.color(Colors.grey).make(),
              validator: (value) {
                if (value == "") {
                  return 'Wajib diisi';
                }
                return null;
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
            ),
            const SizedBox(height: 10),
            'Foto Profil Ustadz'.text.base.bold.make(),
            '(Maksimal file 2 Mb)'.text.lg.bold.make(),
            BlocBuilder<ImageHandlerCubit, ImageHandlerState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    imageHandler.setImage();
                  },
                  child: imageHandler.image == null
                      ? VxBox(child: 'Pilih foto'.text.base.makeCentered())
                          .width(Get.width)
                          .height(200)
                          .rounded
                          .color(Colors.grey[200]!)
                          .border()
                          .make()
                      : VxBox()
                          .width(Get.width)
                          .height(200)
                          .bgImage(DecorationImage(
                              image: FileImage(imageHandler.image!)))
                          .rounded
                          .color(Colors.grey[200]!)
                          .border()
                          .make(),
                );
              },
            ),
            const SizedBox(height: 10),
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: 'Step 2'.text.base.make(),
          content: VStack([
            'Pendidikan'.text.lg.bold.make(),
            const SizedBox(height: 20),
            UstadzPendidikanFormalForm(
              pendidikan: cubit.tk,
              tahun: cubit.tahuntk,
              title: 'TK',
            ),
            const SizedBox(height: 20),
            UstadzPendidikanFormalForm(
              pendidikan: cubit.sd,
              tahun: cubit.tahunsd,
              title: 'SD',
            ),
            const SizedBox(height: 20),
            UstadzPendidikanFormalForm(
              pendidikan: cubit.smp,
              tahun: cubit.tahunsmp,
              title: 'SMP',
            ),
            const SizedBox(height: 20),
            UstadzPendidikanFormalForm(
              pendidikan: cubit.sma,
              tahun: cubit.tahunsma,
              title: 'SMA',
            ),
            const SizedBox(height: 20),
            UstadzPendidikanFormalForm(
              pendidikan: cubit.perguruantinggi,
              tahun: cubit.tahunperguruantinggi,
              title: 'Perguruan Tinggi',
            ),
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: 'Step 3'.text.base.make(),
          content: VStack([
            'Pelatihan'.text.lg.bold.make(),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.dasar,
              title: 'Dasar',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.mahir,
              title: 'Mahir 1',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.mahir2,
              title: 'Mahir 2',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.tot,
              title: 'TOT',
            ),
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: 'Step 4'.text.base.make(),
          content: VStack([
            'Serifikasi Tartil'.text.lg.bold.make(),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.s1,
              title: 'S1',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.s2a,
              title: 'S2A',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.s2b,
              title: 'S2B',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.s2c,
              title: 'S2C',
            ),
            const SizedBox(height: 20),
            UstadzTahunForm(
              controller: cubit.s3,
              title: 'S3',
            ),
          ]),
          isActive: _currentStep >= 0,
          state: _currentStep >= 4 ? StepState.complete : StepState.disabled,
        ),
      ];
}
