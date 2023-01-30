import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../presentation/form_fields.dart';

class UstadzPendidikanFormalForm extends StatelessWidget {
  final String title;
  final TextEditingController pendidikan;
  final TextEditingController tahun;
  const UstadzPendidikanFormalForm(
      {Key? key,
      required this.pendidikan,
      required this.tahun,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      VStack([
        title.text.base.bold.make(),
        FormFields.textFormField(
          controller: pendidikan,
          hint: title,
          validator: (value) {
            if (value == "") {
              return 'Wajib diisi';
            }
            return null;
          },
        ),
      ]).expand(),
      const SizedBox(width: 10),
      VStack([
        'Tahun'.text.base.bold.make(),
        FormFields.textFormField(
            controller: tahun,
            hint: 'Tahun',
            validator: (value) {
              if (value == "") {
                return 'Wajib diisi';
              }
              return null;
            },
            keyboardType: TextInputType.number),
      ]).w(100)
    ]);
  }
}
