import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: const Color(0xFF6C63FF),
    colorScheme: const ColorScheme(
        primary: Color(0xFF6C63FF),
        primaryVariant: Color(0xFF6C63FF),
        secondary: Color(0xFF6C63FF),
        secondaryVariant: Color(0xFF6C63FF),
        surface: Color(0xFF6C63FF),
        background: Color(0xFF6C63FF),
        error: Colors.red,
        onPrimary: Color(0xFF6C63FF),
        onSecondary: Color(0xFF6C63FF),
        onSurface: Color(0xFF6C63FF),
        onBackground: Color(0xFF6C63FF),
        onError: Colors.red,
        brightness: Brightness.light),
    elevatedButtonTheme: ElevatedButtonThemeData(
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
