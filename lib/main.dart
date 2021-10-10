import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
        return const GetMaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}
