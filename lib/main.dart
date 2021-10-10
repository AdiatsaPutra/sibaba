import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/ui/pages/home_page.dart';

void main() {
  runApp(Sibaba());
}

class Sibaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return GetMaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}
