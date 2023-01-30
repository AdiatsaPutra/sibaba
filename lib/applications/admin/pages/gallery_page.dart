import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/image_handler/image_handler_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/photo_page.dart';
import 'package:sibaba/presentation/popup_messages.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../tentang_kami/bloc/cubit/tentang_kami_cubit.dart';
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
          BlocProvider(
            create: (context) => getIt<TentangKamiCubit>()..getTentangkami(),
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
    final profile = context.read<TentangKamiCubit>();
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
              return null;
            },
            success: () {
              Navigator.pop(context);
              PopupMessages.successPopup('Berhasil mengupload foto');
              cubit.reset();
              profile.getTentangkami();
              return null;
            },
            successDelete: () {
              Navigator.pop(context);
              PopupMessages.successPopup('Berhasil menghapus foto');
              cubit.reset();
              profile.getTentangkami();
              return null;
            },
            error: (e) {
              Navigator.pop(context);
              PopupMessages.successPopup(e);
              return null;
            },
            orElse: () {
              return null;
            },
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
        const SizedBox(height: 20),
        'Klik untuk memperbesar'.text.base.make(),
        const SizedBox(height: 10),
        BlocBuilder<TentangKamiCubit, TentangKamiState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const CircularProgressIndicator().centered(),
            loaded: (tentang) => HStack([
              ...tentang.gallery.map((e) => GestureDetector(
                    onTap: () {
                      Get.to(
                        () => PhotoPage(
                          image:
                              'https://badkobantul.tatiumy.com/storage/fileGallery/${e.file}',
                        ),
                      );
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.white,
                          child: VStack([
                            'Anda yakin akan menghapus gallery?'
                                .text
                                .lg
                                .makeCentered(),
                            const SizedBox(height: 10),
                            HStack([
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: 'Batal'.text.base.make(),
                              ).expand(),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  gallery.deleteGallery(e.galleryId);
                                },
                                child: 'Ok'.text.base.make(),
                              ).expand()
                            ]),
                          ]).p16(),
                        ),
                      );
                    },
                    child: VxBox()
                        .width(250)
                        .height(200)
                        .bgImage(DecorationImage(
                          image: NetworkImage(
                              'https://badkobantul.tatiumy.com/storage/fileGallery/${e.file}'),
                          fit: BoxFit.cover,
                        ))
                        .roundedSM
                        .make()
                        .pOnly(right: 10),
                  ))
            ]).scrollHorizontal(),
            orElse: () => const SizedBox(),
          ),
        )
      ],
    ).centered().p16().scrollVertical();
  }
}
