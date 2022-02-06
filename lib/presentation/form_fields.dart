import 'package:flutter/material.dart';
import 'package:sibaba/presentation/color_constant.dart';

class FormFields {
  static textFormField({
    required TextEditingController controller,
    String? hint,
    bool isObscure = false,
    String? Function(String?)? validator,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
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