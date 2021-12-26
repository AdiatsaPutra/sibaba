part of 'lokasi_cubit.dart';

abstract class LokasiState extends Equatable {
  const LokasiState();

  @override
  List<Object> get props => [];
}

class LokasiInitial extends LokasiState {
  @override
  List<Object> get props => [];
}

class LokasiFetched extends LokasiState {
  final List<Location> lokasi;

  const LokasiFetched(this.lokasi);
  @override
  List<Object> get props => [lokasi];
}

class LokasiError extends LokasiState {
  final String message;

  const LokasiError(this.message);
  @override
  List<Object> get props => [message];
}
