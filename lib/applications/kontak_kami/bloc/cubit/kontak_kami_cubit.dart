import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sibaba/applications/kontak_kami/models/info_kontak.dart';
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

  MapController mapController = MapController(
    initMapWithUserPosition: false,
    initPosition:
        GeoPoint(latitude: -7.88701036772721, longitude: 110.33188331534542),
    // areaLimit: const BoundingBox(
    //   east: 10.4922941,
    //   north: 47.8084648,
    //   south: 45.817995,
    //   west: 5.9559113,
    // ),
  );

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
}
