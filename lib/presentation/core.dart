import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/presentation/style.dart';

class Core {
  static showPopupDialog(BuildContext context, String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog();
      },
    );
  }

  static Future<void> confirmPopup(String? title, String? message,
      void Function()? confirm, VoidCallback? cancel) {
    return Get.defaultDialog(
      radius: 10,
      title: title!,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
        child: Center(
          child: Text(
            message!,
            style: darkRegular,
          ),
        ),
      ),
      textConfirm: 'OK',
      textCancel: 'Batal',
      buttonColor: primaryColor,
      cancelTextColor: Colors.black87,
      confirmTextColor: Colors.white,
      onConfirm: confirm,
      onCancel: () => cancel!,
    ).then((value) => value = false);
  }
}
