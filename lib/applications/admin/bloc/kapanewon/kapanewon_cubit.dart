import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/admin/models/kapanewon.dart';
import 'package:sibaba/applications/admin/repositories/kapanewon_repo.dart';

part 'kapanewon_state.dart';
part 'kapanewon_cubit.freezed.dart';

@injectable
class KapanewonCubit extends Cubit<KapanewonState> {
  KapanewonCubit(this._kapanewonRepo) : super(const KapanewonState.initial());

  final KapanewonRepo _kapanewonRepo;

  final key = GlobalKey<FormState>();

  List<Kapanewon> kapanewonList = [];
  final searchKeyword = TextEditingController();

  final name = TextEditingController();
  final kode = TextEditingController();

  String role = '';

  void getKapanewon() async {
    emit(const KapanewonState.loading());
    final kapanewon = await _kapanewonRepo.getKapanewon();
    kapanewon.fold(
      (l) => emit(KapanewonState.error(l.message)),
      (r) {
        kapanewonList = r;
        emit(KapanewonState.loaded(kapanewonList));
      },
    );
  }

  void addUser() async {
    emit(const KapanewonState.loading());
    final kapanewon = await _kapanewonRepo.addKapanewon(name.text, kode.text);
    kapanewon.fold(
      (l) => emit(KapanewonState.error(l.message)),
      (r) => emit(const KapanewonState.added()),
    );
  }

  void updateKapanewon(int id) async {
    emit(const KapanewonState.loading());
    final kapanewon =
        await _kapanewonRepo.updateKapanewon(name.text, kode.text, id);
    kapanewon.fold(
      (l) => emit(KapanewonState.error(l.message)),
      (r) => emit(const KapanewonState.updated()),
    );
  }

  void searchKapanewon() {
    emit(const KapanewonState.loading());
    if (searchKeyword.text.isEmpty) {
      emit(KapanewonState.loaded(kapanewonList));
    } else {
      final filteredKapanewon = kapanewonList
          .where((element) =>
              element.areaName
                  .toLowerCase()
                  .contains(searchKeyword.text.toLowerCase()) ||
              element.kodeArea
                  .toLowerCase()
                  .contains(searchKeyword.text.toLowerCase()))
          .toList();
      emit(KapanewonState.loaded(filteredKapanewon));
    }
  }

  void deleteKapanewon(int id) async {
    emit(const KapanewonState.loading());
    final kapanewon = await _kapanewonRepo.deleteKapanewon(id);
    kapanewon.fold(
      (l) => emit(KapanewonState.error(l.message)),
      (r) => emit(const KapanewonState.deleted()),
    );
  }

  void clear() {
    name.clear();
    kode.clear();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    KapanewonState.error(error.toString());
    super.onError(error, stackTrace);
  }
}
