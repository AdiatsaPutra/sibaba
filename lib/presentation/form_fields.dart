import 'package:flutter/material.dart';
import 'package:sibaba/presentation/color_constant.dart';

class FormFields {
  static textFormField({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
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
    );
  }
}
