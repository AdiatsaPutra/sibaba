import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/injection.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/ustadz/ustadz_cubit.dart';

class DetailDataUstadzPage extends StatelessWidget {
  final int ustadzId;
  const DetailDataUstadzPage({Key? key, required this.ustadzId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Detail Data Ustadz'),
      body: BlocProvider(
        create: (context) => getIt<UstadzCubit>()..getDetailUstadzs(ustadzId),
        child: const _DetailDataUstadzLayout(),
      ),
    );
  }
}

class _DetailDataUstadzLayout extends StatelessWidget {
  const _DetailDataUstadzLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UstadzCubit, UstadzState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const CircularProgressIndicator().centered(),
        detailLoaded: (u) => VStack([
          VxBox(
            child: VStack([
              VxBox()
                  .width(double.infinity)
                  .height(200)
                  .bgImage(DecorationImage(
                      image: NetworkImage(
                          'https://badkobantul.tatiumy.com/storage/fileUstadz/${u.photo.photo}')))
                  .color(Colors.grey)
                  .rounded
                  .make(),
              const SizedBox(height: 10),
              'Identitas'.text.xl.bold.make(),
              const SizedBox(height: 10),
              HStack([
                VStack([
                  'No Induk'.text.base.make(),
                  'Nama'.text.base.make(),
                  'Jenis Kelamin'.text.base.make(),
                  'No Telepon'.text.base.make(),
                  'Alamat'.text.base.make(),
                  'Tempat Lahir'.text.base.make(),
                  'Tanggal Lahir'.text.base.make(),
                  'Email'.text.base.make(),
                  'Mulai Mengajar'.text.base.make(),
                  'Status'.text.base.make(),
                ]),
                const SizedBox(width: 10),
                VStack([
                  u.ustadzs.ustadzsId.toString().text.base.make(),
                  u.ustadzs.nama.text.base.make(),
                  u.ustadzs.gender.text.base.make(),
                  u.ustadzs.telpon!.text.base.make(),
                  u.ustadzs.alamat.text.base.make(),
                  u.ustadzs.tmpLahir.text.base.make(),
                  DateFormat('dd-MM-yyyy')
                      .format(u.ustadzs.tglLahir)
                      .text
                      .base
                      .make(),
                  Builder(
                    builder: (context) => u.ustadzs.email == null
                        ? '-'.text.base.make()
                        : u.ustadzs.email!.text.base.make(),
                  ),
                  u.ustadzs.mulaiUstadz.text.base.make(),
                  u.status.status.text.base.make(),
                ])
              ])
            ]),
          )
              .width(double.infinity)
              .p16
              .color(Colors.white)
              .rounded
              .outerShadowXl
              .make(),
          const SizedBox(height: 20),
          VxBox(
            child: VStack([
              'Pendidikan Formal'.text.xl.bold.make(),
              const SizedBox(height: 10),
              VStack([
                HStack([
                  VStack([
                    'TK'.text.base.make(),
                    'SD'.text.base.make(),
                    'SMP'.text.base.make(),
                    'SMA'.text.base.make(),
                    'Perguruan Tinggi'.text.base.make(),
                  ]).box.width(120).make(),
                  const SizedBox(width: 30),
                  VStack([
                    Builder(
                      builder: (context) => u.pendidikans.tk == null
                          ? '-'.text.base.make()
                          : u.pendidikans.tk!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.sd == null
                          ? '-'.text.base.make()
                          : u.pendidikans.sd!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.smp == null
                          ? '-'.text.base.make()
                          : u.pendidikans.smp!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.sma == null
                          ? '-'.text.base.make()
                          : u.pendidikans.sma!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.pt == null
                          ? '-'.text.base.make()
                          : u.pendidikans.pt!.text.base.make(),
                    ),
                  ]),
                ]),
                HStack([
                  VStack([
                    'Tahun Lulus'.text.base.make(),
                    'Tahun Lulus'.text.base.make(),
                    'Tahun Lulus'.text.base.make(),
                    'Tahun Lulus'.text.base.make(),
                    'Tahun Lulus'.text.base.make(),
                  ]).box.width(100).make(),
                  const SizedBox(width: 50),
                  VStack([
                    Builder(
                      builder: (context) => u.pendidikans.tkLulus == null
                          ? '-'.text.base.make()
                          : u.pendidikans.tkLulus!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.sdLulus == null
                          ? '-'.text.base.make()
                          : u.pendidikans.sdLulus!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.smpLulus == null
                          ? '-'.text.base.make()
                          : u.pendidikans.smpLulus!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.smaLulus == null
                          ? '-'.text.base.make()
                          : u.pendidikans.smaLulus!.text.base.make(),
                    ),
                    Builder(
                      builder: (context) => u.pendidikans.ptLulus == null
                          ? '-'.text.base.make()
                          : u.pendidikans.ptLulus!.text.base.make(),
                    ),
                  ]),
                ]),
              ])
            ]),
          )
              .width(double.infinity)
              .p16
              .color(Colors.white)
              .rounded
              .outerShadowXl
              .make(),
          const SizedBox(height: 20),
          VxBox(
            child: VStack([
              'Pelatihan'.text.xl.bold.make(),
              const SizedBox(height: 10),
              HStack([
                VStack([
                  'Dasar'.text.base.make(),
                  'Mahir 1'.text.base.make(),
                  'Mahir 2'.text.base.make(),
                  'TOT'.text.base.make(),
                ]),
                const SizedBox(width: 10),
                VStack([
                  Builder(
                    builder: (context) => u.pelatihans.dasar == null
                        ? '-'.text.base.make()
                        : u.pelatihans.dasar!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.pelatihans.mahir1 == null
                        ? '-'.text.base.make()
                        : u.pelatihans.mahir1!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.pelatihans.mahir2 == null
                        ? '-'.text.base.make()
                        : u.pelatihans.mahir2!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.pelatihans.tot == null
                        ? '-'.text.base.make()
                        : u.pelatihans.tot!.text.base.make(),
                  ),
                ]),
              ])
            ]),
          )
              .width(double.infinity)
              .p16
              .color(Colors.white)
              .rounded
              .outerShadowXl
              .make(),
          const SizedBox(height: 20),
          VxBox(
            child: VStack([
              'Sertifikasi Tartil'.text.xl.bold.make(),
              const SizedBox(height: 10),
              HStack([
                VStack([
                  'S1'.text.base.make(),
                  'S2A'.text.base.make(),
                  'S2B'.text.base.make(),
                  'S2C'.text.base.make(),
                  'S3'.text.base.make(),
                ]),
                const SizedBox(width: 10),
                VStack([
                  Builder(
                    builder: (context) => u.sertifikasis.s1 == null
                        ? '-'.text.base.make()
                        : u.sertifikasis.s1!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.sertifikasis.s2A == null
                        ? '-'.text.base.make()
                        : u.sertifikasis.s2A!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.sertifikasis.s2B == null
                        ? '-'.text.base.make()
                        : u.sertifikasis.s2B!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.sertifikasis.s2C == null
                        ? '-'.text.base.make()
                        : u.sertifikasis.s2C!.text.base.make(),
                  ),
                  Builder(
                    builder: (context) => u.sertifikasis.s3 == null
                        ? '-'.text.base.make()
                        : u.sertifikasis.s3!.text.base.make(),
                  ),
                ]),
              ])
            ]),
          )
              .width(double.infinity)
              .p16
              .color(Colors.white)
              .rounded
              .outerShadowXl
              .make(),
        ]).p16().scrollVertical(),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
