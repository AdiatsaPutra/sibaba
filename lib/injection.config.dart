// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'applications/admin/bloc/kapanewon/kapanewon_cubit.dart' as _i15;
import 'applications/admin/bloc/user/user_cubit.dart' as _i13;
import 'applications/admin/implementations/admin_user_impl.dart' as _i4;
import 'applications/admin/implementations/kapanewon_repo_impl.dart' as _i6;
import 'applications/admin/repositories/admin_user_repo.dart' as _i3;
import 'applications/admin/repositories/kapanewon_repo.dart' as _i5;
import 'applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart' as _i14;
import 'applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i10;
import 'applications/info_lokasi/repository/location_repo.dart' as _i9;
import 'applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart' as _i16;
import 'applications/kontak_kami/implementations/kontak_kami_repo_impl.dart'
    as _i8;
import 'applications/kontak_kami/repository/kontak_kami_repo.dart' as _i7;
import 'applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart' as _i17;
import 'applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i12;
import 'applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AdminUserRepo>(() => _i4.AdminUserImpl());
  gh.factory<_i5.KapanewonRepo>(() => _i6.KapanewonRepoImpl());
  gh.factory<_i7.KontakKamiRepo>(() => _i8.KontakKamiRepoImpl());
  gh.factory<_i9.LocationRepo>(() => _i10.LocationRepoImpl());
  gh.factory<_i11.TentangKamirepo>(() => _i12.TentangKamiRepoImpl());
  gh.factory<_i13.UserCubit>(() => _i13.UserCubit(get<_i3.AdminUserRepo>()));
  gh.factory<_i14.InfoLokasiCubit>(
      () => _i14.InfoLokasiCubit(get<_i9.LocationRepo>()));
  gh.factory<_i15.KapanewonCubit>(
      () => _i15.KapanewonCubit(get<_i5.KapanewonRepo>()));
  gh.factory<_i16.KontakKamiCubit>(
      () => _i16.KontakKamiCubit(get<_i7.KontakKamiRepo>()));
  gh.factory<_i17.TentangKamiCubit>(
      () => _i17.TentangKamiCubit(get<_i11.TentangKamirepo>()));
  return get;
}
