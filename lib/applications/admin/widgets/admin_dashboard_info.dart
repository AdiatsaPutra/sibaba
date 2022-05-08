import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart';
import 'package:sibaba/applications/admin/bloc/ustadz/ustadz_cubit.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDashboardInfo extends StatelessWidget {
  const AdminDashboardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserCubit>()..getUsers(),
        ),
        BlocProvider(
          create: (context) => getIt<InfoLokasiCubit>()..getLokasi(),
        ),
        BlocProvider(
          create: (context) => getIt<UstadzCubit>()..getUstadzs(),
        ),
      ],
      child: const _AdminDashboardLayout(),
    );
  }
}

class _AdminDashboardLayout extends StatelessWidget {
  const _AdminDashboardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VxBox(
        child: HStack(
          [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _buildAdminInfo('0', 'Loading'),
                loaded: (users) =>
                    _buildAdminInfo('${users.length}', 'Pengguna'),
                orElse: () => const SizedBox(),
              ),
            ),
            BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _buildAdminInfo('0', 'Loading'),
                loaded: (locations) =>
                    _buildAdminInfo('${locations.lokasi.length}', 'Lokasi'),
                orElse: () => const SizedBox(),
              ),
            ),
            BlocBuilder<UstadzCubit, UstadzState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _buildAdminInfo('0', 'Loading'),
                loaded: (ustadz) =>
                    _buildAdminInfo('${ustadz.length}', 'Ustadz'),
                orElse: () => const SizedBox(),
              ),
            ),
          ],
          alignment: MainAxisAlignment.spaceAround,
        ),
      )
          .width(Get.width)
          .height(100)
          .color(Colors.white)
          .rounded
          .outerShadowXl
          .make(),
      VxBox().width(Get.width).height(20).make(),
    ]).p16().scrollVertical();
  }

  _buildAdminInfo(String title, String description) {
    return VStack(
      [
        title.text.xl3.bold.make(),
        description.text.base.make(),
      ],
      crossAlignment: CrossAxisAlignment.center,
    );
  }
}
