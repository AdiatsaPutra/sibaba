import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/applications.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/theme.dart';

void main() {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Sibaba());
}

class Sibaba extends StatelessWidget {
  const Sibaba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(theme: theme(), home: const HomePage());
  }
}
