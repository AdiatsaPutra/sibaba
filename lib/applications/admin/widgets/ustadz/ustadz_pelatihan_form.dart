import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../presentation/form_fields.dart';

class UstadzTahunForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const UstadzTahunForm(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      title.text.base.bold.make().box.width(65).make(),
      const SizedBox(width: 10),
      VxBox(
        child: FormFields.textFormField(
          controller: controller,
          hint: 'Tahun',
          keyboardType: TextInputType.number,
        ),
      ).width(Get.width).make().expand(),
      const SizedBox(width: 10),
      'Tahun'.text.base.bold.make(),
    ]);
  }
}
