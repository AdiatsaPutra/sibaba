import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class KontakPage extends StatefulWidget {
  @override
  _KontakPageState createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  @override
  Widget build(BuildContext context) {
    String? hari;
    List listHari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Pengaturan Kontak Website',
                      style: darkRegular.copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  label: 'Alamat',
                  hintText: 'Alamat',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Link Map',
                  hintText: 'Link Map',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Telpon',
                  hintText: 'Telpon',
                  isPassword: false,
                ),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Email',
                  isPassword: false,
                ),
                Row(
                  children: [
                    DropdownButton(
                      hint: Text("Senin"),
                      value: hari,
                      items: listHari.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          hari = value.toString();
                        });
                      },
                    ),
                    DropdownButton(
                      hint: Text("Senin"),
                      value: hari,
                      items: listHari.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          hari = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                      style: whiteRegular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget),
                      );
                    },
                    child: Text(
                      'Batal',
                      style: whiteRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
