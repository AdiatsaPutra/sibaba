import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_handler_state.dart';
part 'image_handler_cubit.freezed.dart';

class ImageHandlerCubit extends Cubit<ImageHandlerState> {
  ImageHandlerCubit() : super(const ImageHandlerState.initial());

  File? image;

  final ImagePicker _picker = ImagePicker();

  void setImage() async {
    emit(const ImageHandlerState.loading());
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
    emit(const ImageHandlerState.loaded());
  }
}
