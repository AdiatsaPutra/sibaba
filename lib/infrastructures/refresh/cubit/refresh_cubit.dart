import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_state.dart';
part 'refresh_cubit.freezed.dart';

class RefreshCubit extends Cubit<RefreshState> {
  RefreshCubit() : super(const RefreshState.initial());

  void refreshAdminLocation() {
    emit(const RefreshState.loading());
    emit(const RefreshState.locationAdded());
  }
}