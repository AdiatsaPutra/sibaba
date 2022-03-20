import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/applications/login/bloc/login_password/login_password_cubit.dart';
import 'package:sibaba/infrastructures/bloc_observer.dart';
import 'package:sibaba/infrastructures/refresh/cubit/refresh_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/theme.dart';

import 'applications/login/bloc/login/login_cubit.dart';
import 'applications/login/bloc/register/register_cubit.dart';

void main() {
  setupLogging();
  configureInjection('http://192.168.205.170:8000/api/');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  BlocOverrides.runZoned(
    () => runApp(const Sibaba()),
    blocObserver: AppBlocObserver(),
  );
}

class Sibaba extends StatelessWidget {
  const Sibaba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
        ),
        BlocProvider(
          create: (context) => LoginPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => RefreshCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: theme(),
        home: const HomePage(),
      ),
    );
  }
}

setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
