import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lokasi_state.dart';

class LokasiCubit extends Cubit<LokasiState> {
  LokasiCubit() : super(LokasiInitial());
}
