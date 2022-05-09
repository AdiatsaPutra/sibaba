import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/bloc/add_kelurahan/add_kelurahan_cubit.dart';
import 'package:sibaba/applications/admin/bloc/kelurahan/kelurahan_cubit.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../presentation/form_fields.dart';
import '../../models/kelurahan.dart';

class AddKelurahanDialog extends StatelessWidget {
  final int index;
  final int? kapanewonId;
  final int? kelurahanId;
  final KelurahanCubit kelurahan;
  final AddKelurahanCubit cubit;
  final List<Kapanewon> kapanewon;
  final List<Kelurahan> kelurahanList;

  const AddKelurahanDialog(
      {Key? key,
      required this.cubit,
      required this.kapanewon,
      required this.kelurahan,
      this.kelurahanId,
      required this.kelurahanList,
      this.kapanewonId,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i(kapanewon);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cubit,
        ),
        BlocProvider.value(
          value: kelurahan,
        ),
      ],
      child: Dialog(
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        child: VStack([
          'Input Data Kapanewon'.text.xl.bold.make().pOnly(bottom: 10),
          Form(
            key: cubit.key,
            child: VStack([
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: kelurahanId == null
                    ? null
                    : kapanewon
                        .where(
                          (element) =>
                              element.areaId == kelurahanList[index].areaId,
                        )
                        .map((e) => e.areaId)
                        .toString()
                        .replaceAll('(', '')
                        .replaceAll(')', ''),
                hint: 'Pilih Kapanewon'.text.lg.make(),
                items: [
                  ...kapanewon.map((e) {
                    Logger().i(e);
                    return DropdownMenuItem<String>(
                      value: e.areaId.toString(),
                      child: e.areaName.text.lg.make(),
                    );
                  }),
                ],
                validator: (value) {
                  if (value == null) {
                    return 'Pilih Kapanewon';
                  }
                },
                onChanged: (e) {
                  cubit.setKapanewon(int.parse(e!));
                },
              ).box.width(Get.width).make().pOnly(bottom: 10),
              const SizedBox(height: 10),
              FormFields.textFormField(
                controller: cubit.name,
                validator: (value) {
                  if (value == "") {
                    return 'Mohon isi kelurahan';
                  }
                },
                hint: 'Masukkan Nama Kelurahan',
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: 'Batal'.text.base.color(Colors.grey).make(),
            ).box.width(Get.width / 3).make(),
            BlocListener<AddKelurahanCubit, AddKelurahanState>(
              listener: (context, state) => state.maybeWhen(
                added: () {
                  cubit.name.clear();
                  context.read<KelurahanCubit>().getKelurahan();
                },
                updated: () {
                  cubit.name.clear();
                  context.read<KelurahanCubit>().getKelurahan();
                },
                orElse: () {},
              ),
              child: BlocBuilder<AddKelurahanCubit, AddKelurahanState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => ElevatedButton(
                    onPressed: null,
                    child: const CircularProgressIndicator().centered(),
                  ),
                  orElse: () => ElevatedButton(
                    onPressed: kelurahanId != null
                        ? () {
                            if (cubit.key.currentState!.validate()) {
                              cubit.key.currentState!.save();
                              cubit.updateKelurahan(kelurahanId!);
                              Get.back();
                            }
                          }
                        : () {
                            if (cubit.key.currentState!.validate()) {
                              cubit.key.currentState!.save();
                              cubit.addKelurahan();
                              Get.back();
                            }
                          },
                    child: 'Simpan'.text.base.make(),
                  ),
                ),
              ),
            ).box.width(Get.width / 3).make(),
          ])
        ]).p16().scrollVertical(),
      ),
    );
  }
}
