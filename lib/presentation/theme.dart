import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaba/presentation/color_constant.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: primaryColor,
    primaryIconTheme: const IconThemeData(color: primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
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
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      suffixIconColor: primaryColor,
      focusColor: primaryColor,
      contentPadding: const EdgeInsets.all(10),
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    tabBarTheme: const TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
    ),
  );
}
