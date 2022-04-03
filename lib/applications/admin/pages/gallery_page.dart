import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/image_handler/image_handler_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/gallery/gallery_cubit.dart';

class GalleryPage extends StatelessWidget {
  final User u;
  const GalleryPage({Key? key, required this.u}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Gallery',
      ),
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImageHandlerCubit(),
          ),
          BlocProvider(
            create: (context) => getIt<GalleryCubit>(),
          ),
        ],
        child: _GalleryLayout(u: u),
      ),
    );
  }
}

class _GalleryLayout extends StatelessWidget {
  final User u;
  const _GalleryLayout({Key? key, required this.u}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ImageHandlerCubit>();
    final gallery = context.read<GalleryCubit>();
    return VStack(
      [
        BlocBuilder<ImageHandlerCubit, ImageHandlerState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                cubit.setImage();
              },
              child: cubit.image == null
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
                      .bgImage(DecorationImage(image: FileImage(cubit.image!)))
                      .rounded
                      .color(Colors.grey[200]!)
                      .border()
                      .make(),
            );
          },
        ),
        const SizedBox(height: 10),
        BlocListener<GalleryCubit, GalleryState>(
          listener: (context, state) => state.maybeWhen(
            loading: () {
              Get.dialog(
                VxBox(child: const CircularProgressIndicator())
                    .width(50)
                    .height(50)
                    .makeCentered(),
                barrierDismissible: false,
              );
            },
            success: () {
              Navigator.pop(context);
              PopupMessages.successPopup('Berhasil mengupload foto');
            },
            error: (e) {
              Navigator.pop(context);
              PopupMessages.successPopup(e);
            },
            orElse: () {},
          ),
          child: BlocBuilder<ImageHandlerCubit, ImageHandlerState>(
            builder: (context, state) {
              return cubit.image == null
                  ? ElevatedButton(
                      onPressed: null,
                      child: 'Upload Foto'.text.base.make(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        gallery.uploadGallery(cubit.image!, u.id);
                      },
                      child: 'Upload Foto'.text.base.make(),
                    );
            },
          ),
        ),
      ],
    ).centered().p16().scrollVertical();
  }
}
