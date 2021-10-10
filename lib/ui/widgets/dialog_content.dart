import 'package:flutter/material.dart';
import 'package:sibaba/core/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogContent extends StatelessWidget {
  final String? title;
  final Widget? content;

  const DialogContent({Key? key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title!,
          style: darkRegular.copyWith(fontSize: 18.sp),
        ),
      ),
      content: content,
    );
  }
}
