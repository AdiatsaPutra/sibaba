part of 'detail_lokasi_cubit.dart';

abstract class DetailLokasiState extends Equatable {
  const DetailLokasiState();

  @override
  List<Object> get props => [];
}

class DetailLokasiInitial extends DetailLokasiState {
  @override
  List<Object> get props => [];
}

class DetailLokasiFetched extends DetailLokasiState {
  final LokasiDetailModel lokasiDetail;

  const DetailLokasiFetched(this.lokasiDetail);
  @override
  List<Object> get props => [lokasiDetail];
}

class DetailLokasiError extends DetailLokasiState {
  final String message;

  const DetailLokasiError(this.message);
  @override
  List<Object> get props => [message];
}
