import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/cubit/kontak_cubit.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/presentation/style.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class KontakPage extends StatefulWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  _KontakPageState createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController linkMapController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
      appBar: const CustomAppbar(
        title: 'Pengaturan Kontak',
      ),
      body: SafeArea(
        child: BlocBuilder<KontakCubit, KontakState>(
          builder: (context, state) {
            if (state is KontakFetched) {
              KontakModel kontak = state.kontakModel;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        textEditingController: alamatController
                          ..text = kontak.alamat,
                        label: 'Alamat',
                        hintText: 'Alamat',
                        isPassword: false,
                      ),
                      CustomTextField(
                        textEditingController: linkMapController
                          ..text = kontak.linkmaps,
                        label: 'Link Map',
                        hintText: 'Link Map',
                        isPassword: false,
                      ),
                      CustomTextField(
                        textEditingController: noHPController
                          ..text = kontak.telpon,
                        label: 'Telpon',
                        hintText: 'Telpon',
                        isPassword: false,
                      ),
                      CustomTextField(
                        textEditingController: emailController
                          ..text = kontak.email,
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
                        height: 10.h,
                      ),
                      SizedBox(
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
                        height: 10.h,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget),
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
              );
            } else if (state is KontakError) {
              return Text(state.message.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
