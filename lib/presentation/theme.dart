import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaba/presentation/color_constant.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: const Color(0xFF6C63FF),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        textStyle: const TextStyle(color: Colors.white),
        fixedSize: Size(Get.width, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(Get.width, 50),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.all(10),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF6C63FF)),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xFF6C63FF),
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Color(0xFF6C63FF),
          width: 2,
        ),
      ),
    ),
  );
}
