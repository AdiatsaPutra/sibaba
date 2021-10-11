import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:sibaba/core/style.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? value;
  final String? hintText;
  final bool? isPassword;
  final bool? isEnabled;
  final TextInputType? textInputType;

  const CustomTextField({
    Key? key,
    this.label,
    this.value,
    this.hintText,
    this.isPassword,
    this.isEnabled,
    this.textInputType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: darkRegular.copyWith(fontSize: 16.sp),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            maxLines: null,
            enabled: isEnabled,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: darkRegular,
              contentPadding: const EdgeInsets.all(defaultMargin),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
