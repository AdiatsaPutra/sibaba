part of 'kontak_cubit.dart';

abstract class KontakState extends Equatable {
  const KontakState();

  @override
  List<Object> get props => [];
}

class KontakInitial extends KontakState {
  @override
  List<Object> get props => [];
}

class KontakFetched extends KontakState {
  final KontakModel kontakModel;

  const KontakFetched(this.kontakModel);
  @override
  List<Object> get props => [kontakModel];
}

class KontakError extends KontakState {
  final String message;

  const KontakError(this.message);
  @override
  List<Object> get props => [message];
}
