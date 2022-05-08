import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';
import 'package:sibaba/applications/kontak_kami/models/message.dart';
import 'package:sibaba/applications/kontak_kami/models/request/kontak_request.dart';
import 'package:sibaba/applications/kontak_kami/repository/kontak_kami_repo.dart';

part 'kontak_kami_state.dart';
part 'kontak_kami_cubit.freezed.dart';

@injectable
class KontakKamiCubit extends Cubit<KontakKamiState> {
  KontakKamiCubit(this._kontakKamiRepo)
      : super(const KontakKamiState.initial());

  final KontakKamiRepo _kontakKamiRepo;

  final formKey = GlobalKey<FormState>();

  final fullName = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  void getKontakKami() async {
    emit(const KontakKamiState.loading());
    final kontakKami = await _kontakKamiRepo.getKontakKami();
    kontakKami.fold(
      (l) => emit(KontakKamiState.error(l.message)),
      (r) => emit(KontakKamiState.loaded(r)),
    );
  }

  void sendMessage() async {
    emit(const KontakKamiState.loading());
    final kontakKami = await _kontakKamiRepo.sendMessage(
        fullName.text, phone.text, email.text, message.text);
    kontakKami.fold(
      (l) => emit(KontakKamiState.error(l.message)),
      (_) => emit(const KontakKamiState.messageSend()),
    );
  }

  void getMessage() async {
    emit(const KontakKamiState.loading());
    final kontakKami = await _kontakKamiRepo.getMessage();
    kontakKami.fold(
      (l) => emit(KontakKamiState.error(l.message)),
      (r) => emit(KontakKamiState.messageLoaded(r)),
    );
  }
}
