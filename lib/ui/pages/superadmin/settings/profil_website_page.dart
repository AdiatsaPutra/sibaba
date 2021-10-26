import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/models/tentang_model.dart';
import 'package:sibaba/ui/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class ProfilWebsitePage extends StatelessWidget {
  final TextEditingController sejarahContoller = TextEditingController();
  final TextEditingController strukturOrganisasiContoller =
      TextEditingController();
  final TextEditingController visimisihContoller = TextEditingController();

  ProfilWebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Pengaturan Profil',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: BlocBuilder<TentangCubit, TentangState>(
              builder: (context, state) {
                if (state is TentangFetched) {
                  TentangModel tentangModel = state.tentangModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        textEditingController: sejarahContoller
                          ..text = tentangModel.profiles.sejarah
                              .replaceAll('<p>', '')
                              .replaceAll('</p>', ''),
                        label: 'Sejarah Berdiri',
                        hintText: 'Sejarah Berdiri',
                        isPassword: false,
                        value: tentangModel.profiles.sejarah,
                      ),
                      CustomTextField(
                        textEditingController: strukturOrganisasiContoller
                          ..text = tentangModel.profiles.struktur
                              .replaceAll('<p>', '')
                              .replaceAll('</p>', ''),
                        label: 'Struktur Organisasi',
                        hintText: 'Struktur Organisasi',
                        isPassword: false,
                      ),
                      CustomTextField(
                        textEditingController: visimisihContoller
                          ..text = tentangModel.profiles.visimisi
                              .replaceAll('<p>', '')
                              .replaceAll('</p>', ''),
                        label: 'Visi Misi',
                        hintText: 'Visi Misi',
                        isPassword: false,
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
                                  builder: (BuildContext context) => this),
                            );
                          },
                          child: Text(
                            'Batal',
                            style: whiteRegular,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is TentangError) {
                  return Text(state.message.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
