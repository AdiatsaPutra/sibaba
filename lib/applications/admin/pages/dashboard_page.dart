import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:sibaba/applications/admin/bloc/location/location_cubit.dart';
import 'package:sibaba/applications/admin/bloc/maps/maps_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/applications/admin/pages/maps_all_page.dart';
import 'package:sibaba/applications/admin/pages/user_profil.dart';
import 'package:sibaba/applications/admin/widgets/admin_dashboard_info.dart';
import 'package:sibaba/applications/admin/widgets/admin_menu.dart';
import 'package:sibaba/applications/admin/widgets/guest_menu.dart';
import 'package:sibaba/applications/admin/widgets/superadmin_menu.dart';
import 'package:sibaba/injection.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../infrastructures/refresh/cubit/refresh_cubit.dart';
import '../../info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import '../../info_lokasi/model/location.dart';
import '../bloc/user/user_cubit.dart';

class DashboardPage extends StatelessWidget {
  final User user;
  const DashboardPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapsCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<InfoLokasiCubit>()..getLokasi(),
        ),
        BlocProvider(
          create: (context) => getIt<UserCubit>()..profile(user.id),
        ),
      ],
      child: BlocListener<RefreshCubit, RefreshState>(
        listener: (context, state) => state.maybeWhen(
          profileUpdated: () => context.read<UserCubit>().profile(user.id),
          orElse: () {},
        ),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _DashboardLayout(
                  user: user,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
                loaded: (location) => _DashboardLayout(
                  user: user,
                  locations: location,
                ),
                orElse: () => _DashboardLayout(
                  user: user,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
              ),
            ),
            profile: (u) => BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _DashboardLayout(
                  user: u,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
                loaded: (location) => _DashboardLayout(
                  user: u,
                  locations: location,
                ),
                orElse: () => _DashboardLayout(
                  user: u,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
              ),
            ),
            orElse: () => BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => _DashboardLayout(
                  user: user,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
                loaded: (location) => _DashboardLayout(
                  user: user,
                  locations: location,
                ),
                orElse: () => _DashboardLayout(
                  user: user,
                  locations: Location(lokasi: [], maps: [], events: []),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardLayout extends StatefulWidget {
  final User user;
  final Location locations;

  const _DashboardLayout(
      {Key? key, required this.user, required this.locations})
      : super(key: key);

  @override
  State<_DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<_DashboardLayout> {
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  late LatLng showLocation;
  @override
  void initState() {
    showLocation = const LatLng(
      -7.821494391265134,
      110.32701712802746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Selamat Datang, ${widget.user.name}'
            .text
            .color(Colors.white)
            .xl
            .make(),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => UserProfilPage(user: widget.user));
            },
            child: VxBox(
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
                .color(Colors.white.withOpacity(0.5))
                .width(30)
                .height(30)
                .roundedFull
                .make(),
          ).pOnly(right: 16),
        ],
      ),
      body: ZStack([
        VStack([
          VStack([
            ...widget.user.roles.map(
              (e) => e.name == 'superadmin'
                  ? SizedBox(height: Get.height / 6.5)
                  : const SizedBox(),
            ),
          ]),
          VStack([
            const SizedBox(height: 20),
            HStack([
              'Lokasi'.text.lg.bold.make().expand(),
              GestureDetector(
                onTap: () {
                  Get.to(() => const MapsAllPage());
                },
                child: 'Lihat Penuh'.text.lg.make(),
              )
            ]),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: showLocation,
                  zoom: 10.0,
                ),
                markers: getmarkers(widget.locations),
                mapType: MapType.normal,
              ).box.height(120).make(),
            ),
            const SizedBox(height: 20),
            ...widget.user.roles.map(
              (e) => e.name == 'superadmin'
                  ? SuperadminMenu(user: widget.user)
                  : e.name == 'admin'
                      ? AdminMenu(user: widget.user)
                      : const GuestMenu(),
            ),
          ]),
        ]).p20().scrollVertical(),
        VStack([
          ...widget.user.roles.map(
            (e) => e.name == 'superadmin'
                ? VxBox()
                    .width(Get.width)
                    .height(60)
                    .color(Theme.of(context).primaryColor)
                    .bottomRounded(value: 15)
                    .make()
                : const SizedBox(),
          ),
        ]),
        VStack([
          ...widget.user.roles.map(
            (e) => e.name == 'superadmin'
                ? const AdminDashboardInfo()
                : const SizedBox(),
          ),
        ]),
      ]),
    );
  }

  Set<Marker> getmarkers(Location location) {
    setState(() {
      for (var y in location.maps) {
        for (var x in location.lokasi) {
          markers.add(Marker(
            markerId: MarkerId(Random().nextInt(100).toString()),
            position: LatLng(y.latitude, y.longitude),
            infoWindow: InfoWindow(
              title: x.nama,
            ),
          ));
        }
      }
    });

    return markers;
  }
}
