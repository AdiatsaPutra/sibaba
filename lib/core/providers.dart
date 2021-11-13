import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/cubit/kontak_cubit.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/cubit/message_cubit.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/cubit/user_cubit.dart';
import 'package:sibaba/repositories/api_repository.dart';

class Providers {
  static List<BlocProvider> getProviders(BuildContext context) {
    return [
      BlocProvider(
        create: (_) => LokasiCubit(ApiRepositoryImpl())..getLokasi(),
      ),
      BlocProvider(
        create: (_) => TentangCubit(ApiRepositoryImpl())..getTentang(),
      ),
      BlocProvider(
        create: (_) => KontakCubit(ApiRepositoryImpl())..getKontak(),
      ),
      BlocProvider(
        create: (_) => MessageCubit(ApiRepositoryImpl())..getMessage(),
      ),
      BlocProvider(
        create: (_) => UserCubit(ApiRepositoryImpl()),
      ),
    ];
  }
}
