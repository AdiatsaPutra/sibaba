part of 'kapanewon_cubit.dart';

abstract class KapanewonState extends Equatable {
  const KapanewonState();
}

class KapanewonInitial extends KapanewonState {
  @override
  List<Object?> get props => [];
}

class KapanewonFetched extends KapanewonState {
  final List<KapanewonModel> kapanewonModel;

  const KapanewonFetched(this.kapanewonModel);
  @override
  List<Object?> get props => [kapanewonModel];
}

class KapanewonError extends KapanewonState {
  final String message;

  const KapanewonError(this.message);
  @override
  List<Object?> get props => [message];
}
