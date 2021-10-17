import 'package:flutter/material.dart';
import 'package:sibaba/core/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormattedText extends StatelessWidget {
  final String? text;

  const FormattedText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!.replaceAll("<p>", "").replaceAll("</p>", ""),
      // .replaceAll("&nbsp;", ),
      style: darkRegular.copyWith(
        fontSize: 14.sp,
      ),
    );
  }
}
