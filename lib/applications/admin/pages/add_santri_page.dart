import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/models/santri.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/form_fields.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/santri/santri_cubit.dart';

class AddSantriPage extends StatelessWidget {
  const AddSantriPage({Key? key, required this.user, this.santri})
      : super(key: key);
  final User user;
  final Santri? santri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Tambah Santri'),
      body: BlocProvider(
        create: (context) => getIt<SantriCubit>()..init(santri),
        child: _AddSantriLayout(
          user: user,
        ),
      ),
    );
  }
}

class _AddSantriLayout extends StatelessWidget {
  const _AddSantriLayout({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SantriCubit>();
    return Form(
      key: cubit.key,
      child: VStack([
        const SizedBox(height: 10),
        'Wilayah'.text.size(14).make(),
        FormFields.textFormField(
          hint: 'Wilayah',
          controller: cubit.wilayah,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Wilayah tidak boleh kosong !';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        'Unit'.text.size(14).make(),
        FormFields.textFormField(
          hint: 'Unit',
          controller: cubit.unit,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Unit tidak boleh kosong !';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        'Tahun Ajaran'.text.size(14).make(),
        FormFields.textFormField(
          hint: 'Tahun Ajaran',
          controller: cubit.tahunAjaran,
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Tahun Ajaran tidak boleh kosong !';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        'File'.text.size(14).make(),
        BlocBuilder<SantriCubit, SantriState>(
          builder: (context, state) {
            return cubit.fileSantri == null
                ? const SizedBox()
                : cubit.fileSantri.toString().text.size(14).make();
          },
        ),
        FormFields.textFormField(
          hint: 'File',
          readOnly: true,
          onTap: () {
            cubit.setFile();
          },
        ),
        const SizedBox(height: 10),
        BlocListener<SantriCubit, SantriState>(
          listener: (context, state) => state.maybeWhen(
            added: () {
              Navigator.pop(context);
              context.read<RefreshCubit>().santriAdded();
              return null;
            },
            error: (message) => PopupMessages.errorPopup(message),
            orElse: () {
              return null;
            },
          ),
          child: ElevatedButton(
            onPressed: () {
              if (cubit.key.currentState!.validate()) {
                cubit.key.currentState!.save();
                if (cubit.isEdit) {
                  cubit.updateSantri(cubit.santriId!);
                } else {
                  cubit.addSantri(user.id);
                }
              }
            },
            child: 'Simpan'.text.size(14).make(),
          ),
        ).w(Get.width),
      ]).px16().scrollVertical(),
    );
  }
}
