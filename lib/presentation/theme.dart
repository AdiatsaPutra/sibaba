import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: const Color(0xFF6C63FF),
    colorScheme: const ColorScheme(
        primary: Color(0xFF6C63FF),
        primaryVariant: Color(0xFF6C63FF),
        secondary: Color(0xFF3F3D56),
        secondaryVariant: Color(0xFF3F3D56),
        surface: Color(0xFF3F3D56),
        background: Color(0xFF3F3D56),
        error: Color(0xFF3F3D56),
        onPrimary: Color(0xFF3F3D56),
        onSecondary: Color(0xFF3F3D56),
        onSurface: Color(0xFF3F3D56),
        onBackground: Color(0xFF3F3D56),
        onError: Color(0xFF3F3D56),
        brightness: Brightness.light),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
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
