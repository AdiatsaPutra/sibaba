import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/kontak_cubit.dart';
import 'package:sibaba/models/kontak_model.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Kontak',
                            style: darkRegular,
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
                          Row(
                            children: [
                              const Icon(Icons.phone),
                              Text(
                                kontakModel.telpon,
                                style: darkRegular.copyWith(fontSize: 14.sp),
                              ),
                            ],
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
                          Text(
                            'Waktu Operasional',
                            style: darkRegular.copyWith(fontSize: 14.sp),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.date_range_rounded),
                              Row(
                                children: [
                                  Text(
                                    kontakModel.masukJam,
                                    style:
                                        darkRegular.copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    ' S/D ',
                                    style:
                                        darkRegular.copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    kontakModel.selesaiJam,
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
                        label: 'Nama',
                        hintText: 'Masukkan Nama Anda',
                      ),
                      CustomTextField(
                        label: 'Nomor Telpon',
                        hintText: 'Nomor Telpon',
                      ),
                      CustomTextField(
                        label: 'Email',
                        hintText: 'Masukkan Email',
                      ),
                      CustomTextField(
                        label: 'Pesan',
                        hintText: '',
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
                            'Daftar',
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
