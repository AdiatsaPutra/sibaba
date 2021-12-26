import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/models/tentang_model.dart';
import 'package:sibaba/presentation/style.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';

class ProfilWebsitePage extends StatefulWidget {
  const ProfilWebsitePage({Key? key}) : super(key: key);
  @override
  State<ProfilWebsitePage> createState() => _ProfilWebsitePageState();
}

class _ProfilWebsitePageState extends State<ProfilWebsitePage> {
  final HtmlEditorController sejarahController = HtmlEditorController();
  final HtmlEditorController strukturController = HtmlEditorController();
  final HtmlEditorController visimisiController = HtmlEditorController();

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
                  Future.delayed(const Duration(milliseconds: 3000), () {
                    setState(() {
                      sejarahController.setText(tentangModel.profiles.sejarah);
                      strukturController
                          .setText(tentangModel.profiles.struktur);
                      visimisiController
                          .setText(tentangModel.profiles.visimisi);
                    });
                  });
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sejarah',
                        style: darkRegular,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      HtmlEditor(
                        controller: sejarahController,
                        htmlEditorOptions: const HtmlEditorOptions(
                            hint: "Alamat", initialText: 'Loading...'),
                      ),
                      Text(
                        'Struktur Organisasi',
                        style: darkRegular,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      HtmlEditor(
                        controller: strukturController,
                        htmlEditorOptions: const HtmlEditorOptions(
                            hint: "Struktur Organisasi",
                            initialText: 'Loading...'),
                      ),
                      Text(
                        'Visi Misi',
                        style: darkRegular,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      HtmlEditor(
                        controller: visimisiController,
                        htmlEditorOptions: const HtmlEditorOptions(
                            hint: "Visi Misi", initialText: 'Loading...'),
                      ),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            Get.back();
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
