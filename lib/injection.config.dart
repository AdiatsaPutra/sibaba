// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart' as _i7;
import 'applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i4;
import 'applications/info_lokasi/repository/location_repo.dart' as _i3;
import 'applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart' as _i8;
import 'applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i6;
import 'applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LocationRepo>(() => _i4.LocationRepoImpl());
  gh.factory<_i5.TentangKamirepo>(() => _i6.TentangKamiRepoImpl());
  gh.factory<_i7.InfoLokasiCubit>(
      () => _i7.InfoLokasiCubit(get<_i3.LocationRepo>()));
  gh.factory<_i8.TentangKamiCubit>(
      () => _i8.TentangKamiCubit(get<_i5.TentangKamirepo>()));
  return get;
}
