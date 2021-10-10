import 'package:flutter/material.dart';
import 'package:sibaba/ui/widgets/dialog_content.dart';

class Core {
  static showPopupDialog(BuildContext context, String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogContent(
          title: title,
          content: content,
        );
      },
    );
  }
}
