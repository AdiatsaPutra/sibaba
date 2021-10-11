import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:sibaba/ui/pages/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Sibaba());
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
