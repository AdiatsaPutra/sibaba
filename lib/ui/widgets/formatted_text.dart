import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibaba/presentation/style.dart';

class FormattedText extends StatelessWidget {
  final String? text;

  const FormattedText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!
          .replaceAll("<p>", "")
          .replaceAll("</p>", "")
          .replaceAll("&rsquo;", "'")
          .replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;", " "),
      textAlign: TextAlign.justify,
      style: darkRegular.copyWith(
        fontSize: 14.sp,
      ),
    );
  }
}
