part of 'tentang_cubit.dart';

abstract class TentangState extends Equatable {
  const TentangState();

  @override
  List<Object> get props => [];
}

class TentangInitial extends TentangState {
  @override
  List<Object> get props => [];
}

class TentangFetched extends TentangState {
  final TentangModel tentangModel;

  const TentangFetched(this.tentangModel);
  @override
  List<Object> get props => [tentangModel];
}

class TentangError extends TentangState {
  final String message;

  const TentangError(this.message);
  @override
  List<Object> get props => [message];
}
