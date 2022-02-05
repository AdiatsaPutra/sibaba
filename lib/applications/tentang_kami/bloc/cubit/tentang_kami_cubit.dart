import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/tentang_kami/models/tentang.dart';
import 'package:sibaba/applications/tentang_kami/repository/tentang_kami_repo.dart';

part 'tentang_kami_state.dart';
part 'tentang_kami_cubit.freezed.dart';

@injectable
class TentangKamiCubit extends Cubit<TentangKamiState> {
  TentangKamiCubit(this._tentangKamirepo)
      : super(const TentangKamiState.initial());

  final TentangKamirepo _tentangKamirepo;

  final sejarah = HtmlEditorController();
  final struktur = HtmlEditorController();
  final visiMisi = HtmlEditorController();

  void getTentangkami() async {
    emit(const TentangKamiState.loading());
    final tentang = await _tentangKamirepo.getTentangKami();
    tentang.fold(
      (l) => emit(TentangKamiState.error(l.message)),
      (r) => emit(TentangKamiState.loaded(r)),
    );
  }
}
