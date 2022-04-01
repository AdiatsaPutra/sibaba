import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/image_handler/image_handler_cubit.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Gallery',
      ),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => ImageHandlerCubit(),
        child: const _GalleryLayout(),
      ),
    );
  }
}

class _GalleryLayout extends StatelessWidget {
  const _GalleryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ImageHandlerCubit>();
    return VStack(
      [
        BlocBuilder<ImageHandlerCubit, ImageHandlerState>(
          builder: (context, state) {
            return cubit.image == null
                ? VxBox(child: 'Belum ada foto'.text.base.makeCentered())
                    .width(Get.width)
                    .height(200)
                    .rounded
                    .color(Colors.grey[200]!)
                    .make()
                : VxBox()
                    .width(Get.width)
                    .height(200)
                    .bgImage(DecorationImage(image: FileImage(cubit.image!)))
                    .rounded
                    .color(Colors.grey[200]!)
                    .make();
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            cubit.setImage();
          },
          child: 'Pilih Foto'.text.base.make(),
        )
      ],
    ).centered().p16().scrollVertical();
  }
}
