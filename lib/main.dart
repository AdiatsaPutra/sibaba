import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/infrastructures/bloc_observer.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/theme.dart';

void main() {
  configureInjection('http://10.0.2.2:8000/api/');
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = AppBlocObserver();
  runApp(const Sibaba());
}

class Sibaba extends StatelessWidget {
  const Sibaba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme(),
      home: const HomePage(),
    );
  }
}
