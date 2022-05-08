// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'applications/admin/bloc/add_kelurahan/add_kelurahan_cubit.dart' as _i24;
import 'applications/admin/bloc/add_ustadz/add_ustadz_cubit.dart' as _i25;
import 'applications/admin/bloc/gallery/gallery_cubit.dart' as _i27;
import 'applications/admin/bloc/kapanewon/kapanewon_cubit.dart' as _i29;
import 'applications/admin/bloc/kelurahan/kelurahan_cubit.dart' as _i30;
import 'applications/admin/bloc/user/user_cubit.dart' as _i21;
import 'applications/admin/bloc/ustadz/ustadz_cubit.dart' as _i34;
import 'applications/admin/implementations/admin_user_impl.dart' as _i4;
import 'applications/admin/implementations/admin_ustadz_impl.dart' as _i23;
import 'applications/admin/implementations/gallery_repo_impl.dart' as _i6;
import 'applications/admin/implementations/kapanewon_repo_impl.dart' as _i8;
import 'applications/admin/implementations/kelurahan_repo_impl.dart' as _i10;
import 'applications/admin/repositories/admin_user_repo.dart' as _i3;
import 'applications/admin/repositories/gallery_repo.dart' as _i5;
import 'applications/admin/repositories/kapanewon_repo.dart' as _i7;
import 'applications/admin/repositories/kelurahan_repo.dart' as _i9;
import 'applications/admin/repositories/ustadz_repo.dart' as _i22;
import 'applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart' as _i28;
import 'applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i14;
import 'applications/info_lokasi/repository/location_repo.dart' as _i13;
import 'applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart' as _i31;
import 'applications/kontak_kami/bloc/cubit/update_kontak_cubit.dart' as _i20;
import 'applications/kontak_kami/implementations/kontak_kami_repo_impl.dart'
    as _i12;
import 'applications/kontak_kami/repository/kontak_kami_repo.dart' as _i11;
import 'applications/login/bloc/login/login_cubit.dart' as _i32;
import 'applications/login/bloc/register/register_cubit.dart' as _i17;
import 'applications/login/implementations/login_repo_impl.dart' as _i16;
import 'applications/login/repositories/login_repo.dart' as _i15;
import 'applications/tentang_kami/bloc/cubit/edit_tentang_kami_cubit.dart'
    as _i26;
import 'applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart' as _i33;
import 'applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i19;
import 'applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AdminUserRepo>(() => _i4.AdminUserImpl());
  gh.factory<_i5.GalleryRepo>(() => _i6.GalleryRepoImpl());
  gh.factory<_i7.KapanewonRepo>(() => _i8.KapanewonRepoImpl());
  gh.factory<_i9.KelurahanRepo>(() => _i10.KelurahanRepoImpl());
  gh.factory<_i11.KontakKamiRepo>(() => _i12.KontakKamiRepoImpl());
  gh.factory<_i13.LocationRepo>(() => _i14.LocationRepoImpl());
  gh.factory<_i15.LoginRepo>(() => _i16.LoginRepoImpl());
  gh.factory<_i17.RegisterCubit>(
      () => _i17.RegisterCubit(get<_i15.LoginRepo>()));
  gh.factory<_i18.TentangKamirepo>(() => _i19.TentangKamiRepoImpl());
  gh.factory<_i20.UpdateKontakCubit>(
      () => _i20.UpdateKontakCubit(get<_i11.KontakKamiRepo>()));
  gh.factory<_i21.UserCubit>(() => _i21.UserCubit(get<_i3.AdminUserRepo>()));
  gh.factory<_i22.UstadzRepo>(() => _i23.AdminUstadzImpl());
  gh.factory<_i24.AddKelurahanCubit>(
      () => _i24.AddKelurahanCubit(get<_i9.KelurahanRepo>()));
  gh.factory<_i25.AddUstadzCubit>(
      () => _i25.AddUstadzCubit(get<_i22.UstadzRepo>()));
  gh.factory<_i26.EditTentangKamiCubit>(
      () => _i26.EditTentangKamiCubit(get<_i18.TentangKamirepo>()));
  gh.factory<_i27.GalleryCubit>(
      () => _i27.GalleryCubit(get<_i5.GalleryRepo>()));
  gh.factory<_i28.InfoLokasiCubit>(
      () => _i28.InfoLokasiCubit(get<_i13.LocationRepo>()));
  gh.factory<_i29.KapanewonCubit>(
      () => _i29.KapanewonCubit(get<_i7.KapanewonRepo>()));
  gh.factory<_i30.KelurahanCubit>(
      () => _i30.KelurahanCubit(get<_i9.KelurahanRepo>()));
  gh.factory<_i31.KontakKamiCubit>(
      () => _i31.KontakKamiCubit(get<_i11.KontakKamiRepo>()));
  gh.factory<_i32.LoginCubit>(() => _i32.LoginCubit(get<_i15.LoginRepo>()));
  gh.factory<_i33.TentangKamiCubit>(
      () => _i33.TentangKamiCubit(get<_i18.TentangKamirepo>()));
  gh.factory<_i34.UstadzCubit>(() => _i34.UstadzCubit(get<_i22.UstadzRepo>()));
  return get;
}
