import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/cubit/kontak_cubit.dart';
import 'package:sibaba/cubit/message_cubit.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/presentation/style.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class KontakKamiPage extends StatefulWidget {
  const KontakKamiPage({Key? key}) : super(key: key);

  @override
  State<KontakKamiPage> createState() => _KontakKamiPageState();
}

class _KontakKamiPageState extends State<KontakKamiPage> {
  final TextEditingController namaController = TextEditingController();

  final TextEditingController noHPController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController pesanController = TextEditingController();
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Kontak Kami',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: BlocBuilder<KontakCubit, KontakState>(
              builder: (context, state) {
                if (state is KontakFetched) {
                  KontakModel kontakModel = state.kontakModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Kontak',
                            style: darkRegular.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      kontakModel.alamat,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone),
                              Text(
                                kontakModel.telpon,
                                style: darkRegular.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mail),
                              Text(
                                kontakModel.email,
                                style: darkRegular.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Waktu Operasional',
                            style: darkRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.date_range_rounded),
                              Row(
                                children: [
                                  Text(
                                    kontakModel.masukJam.substring(
                                      0,
                                      kontakModel.masukJam.lastIndexOf(':'),
                                    ),
                                    style:
                                        darkRegular.copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    ' S/D ',
                                    style:
                                        darkRegular.copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    kontakModel.selesaiJam.substring(
                                      0,
                                      kontakModel.selesaiJam.lastIndexOf(':'),
                                    ),
                                    style:
                                        darkRegular.copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        textEditingController: namaController,
                        label: 'Nama',
                        hintText: 'Masukkan Nama Anda',
                      ),
                      CustomTextField(
                        textEditingController: noHPController,
                        label: 'Nomor Telpon',
                        hintText: 'Nomor Telpon',
                        textInputType: TextInputType.phone,
                      ),
                      CustomTextField(
                        textEditingController: emailController,
                        label: 'Email',
                        hintText: 'Masukkan Email',
                        textInputType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        textEditingController: pesanController,
                        label: 'Pesan',
                        hintText: 'Masukkan Pesan',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 40.h,
                        child: isSending
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isSending = true;
                                  });
                                  BlocProvider.of<MessageCubit>(context,
                                          listen: false)
                                      .sendMessage(
                                          name: namaController.text,
                                          noHp: noHPController.text,
                                          email: emailController.text,
                                          pesan: pesanController.text);
                                  Get.snackbar(
                                    'Berhasil',
                                    'Berhasil mengirimkan pesan',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    margin: EdgeInsets.all(20.h),
                                  );
                                  setState(() {
                                    isSending = false;
                                  });
                                },
                                child: Text(
                                  'Kirim',
                                  style: whiteRegular,
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                } else if (state is KontakError) {
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
