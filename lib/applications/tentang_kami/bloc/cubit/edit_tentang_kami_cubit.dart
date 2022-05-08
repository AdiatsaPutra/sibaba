import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/tentang_kami/repository/tentang_kami_repo.dart';

part 'edit_tentang_kami_state.dart';
part 'edit_tentang_kami_cubit.freezed.dart';

@injectable
class EditTentangKamiCubit extends Cubit<EditTentangKamiState> {
  EditTentangKamiCubit(this._tentangKamirepo)
      : super(const EditTentangKamiState.initial());

  final TentangKamirepo _tentangKamirepo;

  final struktur = HtmlEditorController();
  final sejarah = HtmlEditorController();
  final visimisi = HtmlEditorController();

  void updateTentangKami() async {
    final strukturText = await struktur.getText();
    final sejarahText = await sejarah.getText();
    final visimisiText = await visimisi.getText();
    emit(const EditTentangKamiState.loading());
    final tentangKami = await _tentangKamirepo.updateTentangkami(
      sejarahText,
      strukturText,
      visimisiText,
    );
    tentangKami.fold(
      (l) => emit(EditTentangKamiState.error(l.message)),
      (r) => emit(const EditTentangKamiState.success()),
    );
  }
}
