import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationDetailPage extends StatelessWidget {
  final String slug;

  const LocationDetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InfoLokasiCubit>()..getLocationDetail(slug),
      child: const Scaffold(
        body: _LocationDetailLayout(),
      ),
    );
  }
}

class _LocationDetailLayout extends StatelessWidget {
  const _LocationDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy');
    return BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const CircularProgressIndicator().centered(),
        detailLoaded: (location) => VStack([
          VxBox()
              .width(Get.width)
              .height(350)
              .bgImage(
                const DecorationImage(
                    image: NetworkImage(
                        'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                    fit: BoxFit.cover),
              )
              .make(),
          VStack([
            location.detailLokasi.nama.text.xl.bold.make(),
            Builder(builder: (context) {
              if (location.detailLokasi.status.toLowerCase() == 'aktif') {
                return location.detailLokasi.status.text.lg.white
                    .make()
                    .box
                    .color(Colors.green)
                    .p8
                    .rounded
                    .make();
              }
              return location.detailLokasi.status.text.base.make();
            }),
            'Akreditasi: ${location.detailLokasi.akreditasi}'
                .text
                .xl
                .bold
                .make(),
            //
            const SizedBox(height: 10),
            'Jadwal Belajar'.text.xl.bold.make(),
            '${location.waktuMasuk} - ${location.waktuSelesai}'.text.xl.make(),
            //
            const SizedBox(height: 10),
            'Tentang TPA'.text.xl.bold.make(),
            HStack([
              VStack([
                'NSPQ'.text.lg.make(),
                'Direktur'.text.lg.make(),
                'Email'.text.lg.make(),
                'Telepon'.text.lg.make(),
                'Tanggal Berdiri'.text.lg.make(),
                'SK Pendirian'.text.lg.make(),
                'Tanggal Akreditasi'.text.lg.make(),
              ]),
              const SizedBox(width: 20),
              VStack([
                location.detailLokasi.nspq.text.lg.bold.make(),
                location.detailLokasi.direktur.text.lg.bold.make(),
                location.detailLokasi.email.text.lg.bold.make(),
                location.detailLokasi.telpUnit.text.lg.bold.make(),
                formatter
                    .format(location.detailLokasi.tglBerdiri)
                    .text
                    .lg
                    .bold
                    .make(),
                location.detailLokasi.skPendirian.text.lg.bold.make(),
                formatter
                    .format(location.detailLokasi.tglAkreditasi)
                    .text
                    .lg
                    .bold
                    .make(),
              ]),
            ]),
            //
            const SizedBox(height: 10),
            'Deskripsi'.text.xl.bold.make(),
            Html(data: location.detailLokasi.deskripsi),
            //
            const SizedBox(height: 10),
            'Lokasi TPA'.text.xl.bold.make(),
            HStack([
              VStack([
                'Latitude'.text.lg.make(),
                'Longtitude'.text.lg.make(),
              ]),
              const SizedBox(width: 20),
              VStack([
                location.maps.latitude.text.lg.bold.make(),
                location.maps.longitude.text.lg.bold.make(),
              ]),
            ]),
            //
            const SizedBox(height: 10),
            'Pengajar'.text.xl.bold.make(),
            const SizedBox(height: 10),
            HStack([
              ...location.ustadzs.map((e) => ZStack([
                    VxBox()
                        .width(200)
                        .height(250)
                        .bgImage(
                          const DecorationImage(
                              image: NetworkImage(
                                  'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                              fit: BoxFit.cover),
                        )
                        .rounded
                        .outerShadowXl
                        .make(),
                    VxBox(
                      child: VStack([
                        const SizedBox().expand(),
                        e.nama.text.base.make(),
                      ]).p16(),
                    ).width(200).height(250).rounded.make(),
                  ]).pOnly(right: 20)),
            ]).scrollHorizontal()
          ]).p16(),
        ]).scrollVertical(),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
