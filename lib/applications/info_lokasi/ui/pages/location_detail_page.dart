import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:intl/intl.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../info_lokasi/model/location_detail.dart';

class LocationDetailPage extends StatelessWidget {
  final String slug;

  const LocationDetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InfoLokasiCubit>()..getLocationDetail(slug),
      child: const Scaffold(
        appBar: CustomAppbar(title: 'Detail Lokasi'),
        body: _LocationDetailLayout(),
      ),
    );
  }
}

class _LocationDetailLayout extends StatefulWidget {
  const _LocationDetailLayout({Key? key}) : super(key: key);

  @override
  State<_LocationDetailLayout> createState() => _LocationDetailLayoutState();
}

class _LocationDetailLayoutState extends State<_LocationDetailLayout> {
  final Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy');
    return BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const CircularProgressIndicator().centered(),
        error: (e) => e.text.base.makeCentered(),
        detailLoaded: (location) => VStack([
          location.foto.isEmpty
              ? VxBox()
                  .width(Get.width)
                  .height(350)
                  .bgImage(
                    const DecorationImage(
                        image: NetworkImage(
                            'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'),
                        fit: BoxFit.cover),
                  )
                  .make()
              : HStack([
                  ...location.foto.map(
                    (e) => VxBox()
                        .width(Get.width)
                        .height(350)
                        .bgImage(
                          DecorationImage(
                              image: NetworkImage(
                                  'https://badkobantul.tatiumy.com/storage/fileLoc/${e.fileLoc}'),
                              fit: BoxFit.cover),
                        )
                        .make(),
                  ),
                ]).scrollHorizontal(),
          VStack([
            VStack([
              HStack([
                location.detailLokasi.nama.text.xl.bold.make().expand(),
                Builder(builder: (context) {
                  if (location.detailLokasi.status.toLowerCase() == 'aktif') {
                    return location.detailLokasi.status.text.lg.white
                        .make()
                        .box
                        .color(Colors.red)
                        .p8
                        .rounded
                        .make();
                  }
                  return location.detailLokasi.status.text.base.make();
                }),
              ]),
              'Akreditasi: ${location.detailLokasi.akreditasi}'
                  .text
                  .xl
                  .bold
                  .make(),
              //
              const SizedBox(height: 10),
              'Jadwal Belajar'.text.xl.bold.make(),
              '${location.waktuMasuk} - ${location.waktuSelesai}'
                  .text
                  .xl
                  .make(),
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
                  location.detailLokasi.nspq == null
                      ? '-'.text.base.make()
                      : location.detailLokasi.nspq!.text.lg.bold.make(),
                  location.detailLokasi.direktur.text.lg.bold.make(),
                  location.detailLokasi.email == null
                      ? '-'.text.base.make()
                      : location.detailLokasi.email!.text.lg.bold.make(),
                  location.detailLokasi.telpUnit == null
                      ? '-'.text.base.make()
                      : location.detailLokasi.telpUnit!.text.lg.bold.make(),
                  formatter
                      .format(location.detailLokasi.tglBerdiri!)
                      .text
                      .lg
                      .bold
                      .make(),
                  location.detailLokasi.skPendirian == null
                      ? '-'.text.base.make()
                      : location.detailLokasi.skPendirian!.text.lg.bold.make(),
                  location.detailLokasi.tglAkreditasi == null
                      ? '-'.text.base.make()
                      : formatter
                          .format(DateTime.parse(
                              location.detailLokasi.tglAkreditasi!))
                          .text
                          .lg
                          .bold
                          .make(),
                ]),
              ]),
            ]).p16(),
            //
            const SizedBox(height: 10),
            'Deskripsi'.text.xl.bold.make().px16(),
            Html(data: location.detailLokasi.deskripsi).px8(),
            //
            VStack([
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target:
                        LatLng(location.maps.latitude, location.maps.longitude),
                    zoom: 20.0,
                  ),
                  markers: getmarkers(location),
                  mapType: MapType.normal,
                ).box.width(context.screenWidth).height(120).make(),
              ),
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
            ]).px16(),
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
                  ]).pOnly(right: 20, left: 16)),
            ]).scrollHorizontal()
          ]),
          const SizedBox(height: 20),
        ]).scrollVertical(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Set<Marker> getmarkers(LocationDetail location) {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() {
        markers.add(
          Marker(
            markerId: MarkerId(Random().nextInt(100).toString()),
            position: LatLng(location.maps.latitude, location.maps.longitude),
          ),
        );
      }),
    );

    return markers;
  }
}
