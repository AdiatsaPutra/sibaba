import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/repositories/gallery_repo.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._galleryRepo) : super(const GalleryState.initial());

  final GalleryRepo _galleryRepo;

  void uploadGallery(File file, int userId) async {
    emit(const GalleryState.loading());
    final upload = await _galleryRepo.uploadGallery(file, userId);
    upload.fold(
      (l) => emit(GalleryState.error(l.message)),
      (r) => emit(const GalleryState.success()),
    );
  }

  void deleteGallery(int galleryId) async {
    emit(const GalleryState.loading());
    final upload = await _galleryRepo.deleteGallery(galleryId);
    upload.fold(
      (l) => emit(GalleryState.error(l.message)),
      (r) => emit(const GalleryState.successDelete()),
    );
  }
}
