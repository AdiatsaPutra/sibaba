import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/detail_lokasi_cubit.dart';
import 'package:sibaba/models/lokasi_detail_model.dart';
import 'package:sibaba/repositories/api_repository.dart';
import 'package:sibaba/ui/widgets/formatted_text.dart';

class DetailLokasiPage extends StatelessWidget {
  final String? slug;

  const DetailLokasiPage({Key? key, this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailLokasiCubit(ApiRepositoryImpl())..getDetailLokasi(slug),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200.h,
                      width: Get.width.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 25.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: defaultMargin,
                  ),
                  child: BlocBuilder<DetailLokasiCubit, DetailLokasiState>(
                    builder: (context, state) {
                      if (state is DetailLokasiFetched) {
                        LokasiDetailModel lokasiDetail = state.lokasiDetail;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Table(
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'Nama',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.nama,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'NSPQ',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.nspq,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Direktur',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.direktur,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Email',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.email,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Nomor Telepon',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.telpUnit,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Tempat Belajar',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.tmpBelajar,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Tanggal Berdiri',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.tglBerdiri
                                          .toString(),
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'SK Pendirian',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.skPendirian,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Tanggal Akreditasi',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.detailLokasi.tglAkreditasi
                                          .toString(),
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Hari masuk',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      'Senin, Selasa, Rabu, Kamis, Jumat, Sabtu',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Jam masuk',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.waktuMasuk,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Jam selesai',
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      lokasiDetail.waktuSelesai,
                                      style:
                                          darkRegular.copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Deskripsi:',
                              style: darkRegular.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            FormattedText(
                              text: lokasiDetail.detailLokasi.deskripsi,
                            ),
                          ],
                        );
                      } else if (state is DetailLokasiError) {
                        return Text(state.message.toString());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
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
