import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sibaba/applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../tentang_kami/bloc/cubit/edit_tentang_kami_cubit.dart';

class ProfilWebsitePage extends StatelessWidget {
  const ProfilWebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Profil Website'.text.xl.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<TentangKamiCubit>()..getTentangkami(),
          ),
          BlocProvider(
            create: (context) => getIt<EditTentangKamiCubit>(),
          ),
        ],
        child: const _ProfilWebsiteLayout(),
      ),
    );
  }
}

class _ProfilWebsiteLayout extends StatelessWidget {
  const _ProfilWebsiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TentangKamiCubit>();
    final editTentangKamiCubit = context.read<EditTentangKamiCubit>();
    return VStack([
      BlocBuilder<TentangKamiCubit, TentangKamiState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const LoadingIndicator(isScrollable: true),
          loaded: (tentang) {
            Future.delayed(const Duration(seconds: 3)).then((value) {
              editTentangKamiCubit.sejarah.setText(tentang.profiles.sejarah);
              editTentangKamiCubit.struktur.setText(tentang.profiles.struktur);
              editTentangKamiCubit.visimisi.setText(tentang.profiles.visimisi);
            });
            return VStack([
              const SizedBox(height: 10),
              'Sejarah Berdiri'.text.lg.make(),
              const SizedBox(height: 10),
              HtmlEditor(controller: editTentangKamiCubit.sejarah),
              const SizedBox(height: 10),
              'Struktur Organisasi'.text.lg.make(),
              const SizedBox(height: 10),
              HtmlEditor(controller: editTentangKamiCubit.struktur),
              const SizedBox(height: 10),
              'Visi Misi'.text.lg.make(),
              const SizedBox(height: 10),
              HtmlEditor(controller: editTentangKamiCubit.visimisi),
            ]);
          },
          orElse: () => const SizedBox(),
        ),
      ).p16().scrollVertical().expand(),
      HStack([
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Get.back();
          },
          child: 'Batal'.text.base.make(),
        ).expand(),
        const SizedBox(width: 10),
        BlocListener<EditTentangKamiCubit, EditTentangKamiState>(
          listener: (context, state) => state.maybeWhen(
            success: () {
              cubit.getTentangkami();
              PopupMessages.successPopup('Profile berhasil diubah');
              return null;
            },
            orElse: () {
              return null;
            },
          ),
          child: BlocBuilder<EditTentangKamiCubit, EditTentangKamiState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => ElevatedButton(
                onPressed: null,
                child: const CircularProgressIndicator().centered(),
              ),
              orElse: () => ElevatedButton(
                onPressed: () {
                  editTentangKamiCubit.updateTentangKami();
                },
                child: 'Simpan'.text.base.make(),
              ),
            ),
          ),
        ).expand()
      ]).p16()
    ]);
  }
}
