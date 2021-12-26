// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart' as _i9;
import 'applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i6;
import 'applications/info_lokasi/repository/location_repo.dart' as _i5;
import 'applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart' as _i10;
import 'applications/kontak_kami/implementations/kontak_kami_repo_impl.dart'
    as _i4;
import 'applications/kontak_kami/repository/kontak_kami_repo.dart' as _i3;
import 'applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart' as _i11;
import 'applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i8;
import 'applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.KontakKamiRepo>(() => _i4.KontakKamiRepoImpl());
  gh.factory<_i5.LocationRepo>(() => _i6.LocationRepoImpl());
  gh.factory<_i7.TentangKamirepo>(() => _i8.TentangKamiRepoImpl());
  gh.factory<_i9.InfoLokasiCubit>(
      () => _i9.InfoLokasiCubit(get<_i5.LocationRepo>()));
  gh.factory<_i10.KontakKamiCubit>(
      () => _i10.KontakKamiCubit(get<_i3.KontakKamiRepo>()));
  gh.factory<_i11.TentangKamiCubit>(
      () => _i11.TentangKamiCubit(get<_i7.TentangKamirepo>()));
  return get;
}
