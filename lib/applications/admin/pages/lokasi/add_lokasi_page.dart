import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sibaba/applications/admin/bloc/kelurahan/kelurahan_cubit.dart';
import 'package:sibaba/applications/admin/bloc/location/location_cubit.dart';
import 'package:sibaba/applications/admin/bloc/maps/maps_cubit.dart';
import 'package:sibaba/applications/info_lokasi/model/location_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../infrastructures/constant.dart';
import '../../../../infrastructures/refresh/cubit/refresh_cubit.dart';
import '../../../../injection.dart';
import '../../../../presentation/form_fields.dart';
import '../../../../presentation/popup_messages.dart';
import '../../../../presentation/widgets/custom_appbar.dart';
import '../../../info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import '../../bloc/kapanewon/kapanewon_cubit.dart';
import '../../models/user.dart';

class AddLokasiPage extends StatelessWidget {
  final LatLng latLng;
  final bool isEdit;
  final LocationDetail? locationDetail;
  final User user;
  const AddLokasiPage(
      {Key? key,
      required this.isEdit,
      required this.user,
      required this.latLng,
      this.locationDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: isEdit == true ? 'Edit Lokasi' : 'Tambah Lokasi',
      ),
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MapsCubit()
              ..setInitialPosition(latLng)
              ..changeMarkerposition(latLng),
          ),
          isEdit == true
              ? BlocProvider(
                  create: (context) => LocationCubit()
                    ..getAddress(LatLng(locationDetail!.maps.latitude,
                        locationDetail!.maps.longitude)),
                )
              : BlocProvider(
                  create: (context) => LocationCubit()..getAddress(latLng),
                ),
        ],
        child: Builder(
          builder: (context) {
            return isEdit == true
                ? MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            getIt<InfoLokasiCubit>()..init(l: locationDetail),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<KapanewonCubit>()..getKapanewon(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<KelurahanCubit>()..getKelurahan(),
                      ),
                    ],
                    child: _AddLokasiLayout(isEdit: isEdit, user: user),
                  )
                : MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            getIt<InfoLokasiCubit>()..setLocation(latLng),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<KapanewonCubit>()..getKapanewon(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<KelurahanCubit>(),
                      ),
                    ],
                    child: _AddLokasiLayout(isEdit: isEdit, user: user),
                  );
          },
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
    final mapsCubit = context.read<MapsCubit>();
    final locationCubit = context.read<LocationCubit>();
    final kelurahanCubit = context.read<KelurahanCubit>();
    final isLastStep = _currentStep == 3;
    return Column(
      children: [
        Expanded(
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
                              return null;
                            },
                            orElse: () {
                              return null;
                            },
                          ),
                          builder: (context, state) => state.maybeWhen(
                            loading: () => ElevatedButton(
                              onPressed: null,
                              child:
                                  const CircularProgressIndicator().centered(),
                            ),
                            orElse: () => ElevatedButton(
                              onPressed: widget.isEdit
                                  ? () {}
                                  : () {
                                      cubit
                                          .addLokasi(widget.user.id.toString());
                                    },
                              child: 'Simpan'.text.base.make(),
                            ),
                          ),
                        ).expand()
                      : ElevatedButton(
                          onPressed: () {
                            continued(cubit, mapsCubit, locationCubit);
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
            steps: getSteps(cubit, mapsCubit, locationCubit, kelurahanCubit),
          ),
        ),
      ],
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued(
      InfoLokasiCubit cubit, MapsCubit mapsCubit, LocationCubit locationCubit) {
    setState(() {
      if (cubit.formKeys[_currentStep].currentState!.validate()) {
        _currentStep += 1;
      }
    });
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  List<Step> getSteps(
    InfoLokasiCubit cubit,
    MapsCubit mapsCubit,
    LocationCubit locationCubit,
    KelurahanCubit kelurahanCubit,
  ) =>
      [
        Step(
          title: 'Step 1'.text.base.make(),
          content: Form(
            key: cubit.formKeys[0],
            child: VStack([
              BlocBuilder<KapanewonCubit, KapanewonState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => DropdownButtonFormField<String>(
                    hint: 'Loading'.text.lg.make(),
                    items: const [],
                    onChanged: (e) {},
                  ).box.width(Get.width).make().pOnly(bottom: 10),
                  loaded: (kapanewon) {
                    cubit.kapanewon == ''
                        ? null
                        : cubit.initKapanewon(kapanewon
                            .where((element) =>
                                element.areaName == cubit.kapanewon)
                            .first
                            .areaId);
                    return HStack([
                      DropdownButtonFormField(
                        value: cubit.kapanewon == ''
                            ? null
                            : kapanewon
                                .where((element) =>
                                    element.areaName == cubit.kapanewon)
                                .first
                                .areaId,
                        hint: 'Pilih Kapanewon'.text.lg.make(),
                        items: [
                          ...kapanewon.map((e) {
                            return DropdownMenuItem(
                              value: e.areaId,
                              child: e.areaName.text.lg.make(),
                            );
                          }),
                        ],
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih Kapanewon';
                          }
                          return null;
                        },
                        onChanged: (e) {
                          cubit.setKapanewon(e as int);
                          kelurahanCubit.getKelurahan();
                        },
                      ).box.width(Get.width - 50).make().pOnly(bottom: 10),
                    ]);
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
              BlocBuilder<KelurahanCubit, KelurahanState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => DropdownButtonFormField<String>(
                    hint: 'Loading'.text.lg.make(),
                    items: const [],
                    onChanged: (e) {},
                  ).box.width(Get.width).make().pOnly(bottom: 10),
                  loaded: (kapanewon) => HStack([
                    DropdownButtonFormField(
                      hint: 'Pilih Kelurahan'.text.lg.make(),
                      items: [
                        ...kapanewon
                            .where(
                          (element) => element.areaId == cubit.kapanewonId,
                        )
                            .map((e) {
                          return DropdownMenuItem(
                            value: e.districtId,
                            child: e.districtName.text.lg.make(),
                          );
                        }),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih Kapanewon';
                        }
                        return null;
                      },
                      onChanged: (e) {
                        cubit.setKelurahan(e as int);
                      },
                    ).box.width(Get.width - 50).make().pOnly(bottom: 10),
                  ]),
                  orElse: () => DropdownButtonFormField<String>(
                    hint: 'Kelurahan'.text.lg.make(),
                    items: const [],
                    onChanged: (e) {},
                  ).box.width(Get.width).make().pOnly(bottom: 10),
                ),
              ),
              'NSPQ'.text.base.bold.make(),
              FormFields.textFormField(
                controller: cubit.nspq,
                hint: 'NSPQ',
                validator: (value) {
                  if (value == "") {
                    return 'Wajib diisi';
                  }
                  return null;
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
                  return null;
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
                  return null;
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
                  return null;
                },
                keyboardType: TextInputType.number,
                formatter: [
                  LengthLimitingTextInputFormatter(13),
                ],
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
                  return null;
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
                  return null;
                },
              ),
            ]),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Step 2'),
          content: Form(
            key: cubit.formKeys[1],
            child: VStack([
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
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              'Pilih Akreditasi'.text.base.bold.make(),
              DropdownButtonFormField<String>(
                value: cubit.akreditasi == '' ? null : cubit.akreditasi,
                hint: 'Pilih Akreditasi'.text.base.color(Colors.grey).make(),
                validator: (value) {
                  if (value == "") {
                    return 'Wajib diisi';
                  }
                  return null;
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
                    initialValue: cubit.tanggalBerdiri.text.isEmpty
                        ? null
                        : DateTime.parse(cubit.tanggalBerdiri.text),
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
                      return null;
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
                  return null;
                },
              ),
              const SizedBox(height: 10),
              'Tanggal Akreditasi'.text.base.bold.make(),
              BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
                builder: (context, state) {
                  return DateTimeField(
                    initialValue: cubit.tanggalAkreditasi.text.isEmpty
                        ? null
                        : DateTime.parse(cubit.tanggalAkreditasi.text),
                    decoration: const InputDecoration(
                      hintText: 'Tanggal Akreditasi',
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
                value: cubit.status == '' ? null : cubit.status,
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
              ).pOnly(bottom: 10),
            ]),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Step 3'),
          content: Form(
            key: cubit.formKeys[2],
            child: VStack([
              const SizedBox(height: 10),
              'Deskripsi'.text.base.bold.make(),
              HtmlEditor(
                controller: cubit.deskripsi,
                htmlEditorOptions: HtmlEditorOptions(
                  initialText: cubit.deskripsiText,
                ),
              ).box.height(200).make().pOnly(bottom: 10),
              const SizedBox(height: 10),
              'Hari Masuk'.text.base.bold.make(),
              BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
                builder: (context, state) {
                  return MultiSelectDialogField<String>(
                    initialValue:
                        cubit.hariMasuk == '' ? [] : cubit.hariMasuk.split(','),
                    items: listHari.map((e) => MultiSelectItem(e, e)).toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      cubit.setHariMasuk(values.join(','));
                    },
                    buttonIcon: null,
                    searchHint: 'Pilih Hari Masuk',
                  );
                },
              ).pOnly(bottom: 10),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VStack([
                    'Jam Masuk'.text.base.bold.make(),
                    DateTimeField(
                      initialValue: cubit.jamMasuk.text.isEmpty
                          ? null
                          : DateTime.parse(
                              '1999-12-20 ${cubit.jamMasuk.text}:00'),
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
                        return null;
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
                      initialValue: cubit.jamKeluar.text.isEmpty
                          ? null
                          : DateTime.parse(
                              '1999-12-20 ${cubit.jamKeluar.text}:00'),
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
                        return null;
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
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Step 4'),
          content: Form(
            key: cubit.formKeys[3],
            child: VStack([
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VxBox(
                  child: MultiBlocListener(
                    listeners: [
                      BlocListener<LocationCubit, LocationState>(
                        listener: (context, state) => state.maybeWhen(
                          success: () => mapsCubit.moveCameraToCurrentPosition(
                            lat: locationCubit.locationData.latitude!,
                            lng: locationCubit.locationData.longitude!,
                          ),
                          orElse: () => null,
                        ),
                      ),
                    ],
                    child: BlocBuilder<MapsCubit, MapsState>(
                      builder: (context, state) {
                        return GoogleMap(
                          initialCameraPosition: mapsCubit.initialPosition,
                          mapType: MapType.normal,
                          onMapCreated: (controller) {
                            mapsCubit.createController(controller);
                          },
                          onTap: (langId) {
                            state.maybeWhen(
                              loading: () => null,
                              orElse: () {
                                mapsCubit.changeMarkerposition(langId);
                                locationCubit.getAddress(langId);
                                cubit.setLocation(langId);
                              },
                            );
                          },
                          markers: mapsCubit.markers,
                        );
                      },
                    ),
                  ),
                ).width(Get.width).height(500).make(),
              ),
              const SizedBox(height: 20),
              HStack([
                VStack([
                  'Lattitude'.text.base.bold.make(),
                  VxBox(
                    child: FormFields.textFormField(
                      controller: cubit.lat,
                      hint: 'Lattitude',
                    ),
                  ).make()
                ]).expand(),
                const SizedBox(width: 15),
                VStack([
                  'Longtitude'.text.base.bold.make(),
                  VxBox(
                    child: FormFields.textFormField(
                      controller: cubit.lat,
                      hint: 'Longtitude',
                    ),
                  ).make()
                ]).expand()
              ])
            ]),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
        ),
      ];
}
