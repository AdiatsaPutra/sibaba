import 'package:flutter/material.dart';
import 'package:sibaba/presentation/constants.dart';

extension SibabaTextField on Widget {
  Widget stylized({String? hint}) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryColor),
          ),
          contentPadding: EdgeInsets.all(10)),
    );
  }
}
