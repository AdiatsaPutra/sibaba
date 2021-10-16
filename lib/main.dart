import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/repositories/api_repository.dart';
import 'package:sibaba/ui/pages/home_page.dart';

void main() {
  runApp(const Sibaba());
}

class Sibaba extends StatelessWidget {
  const Sibaba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LokasiCubit(ApiRepositoryImpl())..getLokasi(),
            ),
            BlocProvider(
              create: (_) => TentangCubit(ApiRepositoryImpl())..getTentang(),
            ),
          ],
          child: const GetMaterialApp(
            home: HomePage(),
          ),
        );
      },
    );
  }
}
