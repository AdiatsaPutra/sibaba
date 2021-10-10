import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibaba/core/style.dart';

class PesanTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          'kjhsiahs',
          style: darkRegular,
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'kahsaishiahsiu@yahgsha.ahs',
                  style: darkRegular,
                ),
                Text(
                  '89878676',
                  style: darkRegular,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'kahsaishiahsiuasas as as as as asasas as asasasas asasasasas asasasasas asas',
                  style: darkRegular,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Hapus',
                    style: darkRegular.copyWith(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
