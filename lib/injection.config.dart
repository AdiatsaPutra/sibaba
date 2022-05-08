// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'applications/admin/bloc/add_ustadz/add_ustadz_cubit.dart' as _i22;
import 'applications/admin/bloc/gallery/gallery_cubit.dart' as _i24;
import 'applications/admin/bloc/kapanewon/kapanewon_cubit.dart' as _i26;
import 'applications/admin/bloc/user/user_cubit.dart' as _i19;
import 'applications/admin/bloc/ustadz/ustadz_cubit.dart' as _i30;
import 'applications/admin/implementations/admin_user_impl.dart' as _i4;
import 'applications/admin/implementations/admin_ustadz_impl.dart' as _i21;
import 'applications/admin/implementations/gallery_repo_impl.dart' as _i6;
import 'applications/admin/implementations/kapanewon_repo_impl.dart' as _i8;
import 'applications/admin/repositories/admin_user_repo.dart' as _i3;
import 'applications/admin/repositories/gallery_repo.dart' as _i5;
import 'applications/admin/repositories/kapanewon_repo.dart' as _i7;
import 'applications/admin/repositories/ustadz_repo.dart' as _i20;
import 'applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart' as _i25;
import 'applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i12;
import 'applications/info_lokasi/repository/location_repo.dart' as _i11;
import 'applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart' as _i27;
import 'applications/kontak_kami/bloc/cubit/update_kontak_cubit.dart' as _i18;
import 'applications/kontak_kami/implementations/kontak_kami_repo_impl.dart'
    as _i10;
import 'applications/kontak_kami/repository/kontak_kami_repo.dart' as _i9;
import 'applications/login/bloc/login/login_cubit.dart' as _i28;
import 'applications/login/bloc/register/register_cubit.dart' as _i15;
import 'applications/login/implementations/login_repo_impl.dart' as _i14;
import 'applications/login/repositories/login_repo.dart' as _i13;
import 'applications/tentang_kami/bloc/cubit/edit_tentang_kami_cubit.dart'
    as _i23;
import 'applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart' as _i29;
import 'applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i17;
import 'applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AdminUserRepo>(() => _i4.AdminUserImpl());
  gh.factory<_i5.GalleryRepo>(() => _i6.GalleryRepoImpl());
  gh.factory<_i7.KapanewonRepo>(() => _i8.KapanewonRepoImpl());
  gh.factory<_i9.KontakKamiRepo>(() => _i10.KontakKamiRepoImpl());
  gh.factory<_i11.LocationRepo>(() => _i12.LocationRepoImpl());
  gh.factory<_i13.LoginRepo>(() => _i14.LoginRepoImpl());
  gh.factory<_i15.RegisterCubit>(
      () => _i15.RegisterCubit(get<_i13.LoginRepo>()));
  gh.factory<_i16.TentangKamirepo>(() => _i17.TentangKamiRepoImpl());
  gh.factory<_i18.UpdateKontakCubit>(
      () => _i18.UpdateKontakCubit(get<_i9.KontakKamiRepo>()));
  gh.factory<_i19.UserCubit>(() => _i19.UserCubit(get<_i3.AdminUserRepo>()));
  gh.factory<_i20.UstadzRepo>(() => _i21.AdminUstadzImpl());
  gh.factory<_i22.AddUstadzCubit>(
      () => _i22.AddUstadzCubit(get<_i20.UstadzRepo>()));
  gh.factory<_i23.EditTentangKamiCubit>(
      () => _i23.EditTentangKamiCubit(get<_i16.TentangKamirepo>()));
  gh.factory<_i24.GalleryCubit>(
      () => _i24.GalleryCubit(get<_i5.GalleryRepo>()));
  gh.factory<_i25.InfoLokasiCubit>(
      () => _i25.InfoLokasiCubit(get<_i11.LocationRepo>()));
  gh.factory<_i26.KapanewonCubit>(
      () => _i26.KapanewonCubit(get<_i7.KapanewonRepo>()));
  gh.factory<_i27.KontakKamiCubit>(
      () => _i27.KontakKamiCubit(get<_i9.KontakKamiRepo>()));
  gh.factory<_i28.LoginCubit>(() => _i28.LoginCubit(get<_i13.LoginRepo>()));
  gh.factory<_i29.TentangKamiCubit>(
      () => _i29.TentangKamiCubit(get<_i16.TentangKamirepo>()));
  gh.factory<_i30.UstadzCubit>(() => _i30.UstadzCubit(get<_i20.UstadzRepo>()));
  return get;
}
