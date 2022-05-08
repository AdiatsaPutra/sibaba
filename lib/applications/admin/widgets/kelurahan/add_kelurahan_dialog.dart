import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/add_kelurahan/add_kelurahan_cubit.dart';
import 'package:sibaba/applications/admin/bloc/kelurahan/kelurahan_cubit.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../presentation/form_fields.dart';

class AddKelurahanDialog extends StatelessWidget {
  final KelurahanCubit kelurahan;
  final AddKelurahanCubit cubit;
  final List<Kapanewon> kapanewon;

  const AddKelurahanDialog(
      {Key? key,
      required this.cubit,
      required this.kapanewon,
      required this.kelurahan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                hint: 'Pilih Kapanewon'.text.lg.make(),
                items: [
                  ...kapanewon.map(
                    (e) => DropdownMenuItem<String>(
                      value: e.areaId.toString(),
                      child: e.areaName.text.lg.make(),
                    ),
                  ),
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
                orElse: () {},
              ),
              child: BlocBuilder<AddKelurahanCubit, AddKelurahanState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => ElevatedButton(
                    onPressed: null,
                    child: const CircularProgressIndicator().centered(),
                  ),
                  orElse: () => ElevatedButton(
                    onPressed: () {
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
