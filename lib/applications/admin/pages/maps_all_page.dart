import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sibaba/applications/admin/bloc/location/location_cubit.dart';
import 'package:sibaba/applications/admin/bloc/maps/maps_cubit.dart';
import 'package:sibaba/injection.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import '../../info_lokasi/model/location.dart';

class MapsAllPage extends StatelessWidget {
  const MapsAllPage({
    Key? key,
  }) : super(key: key);

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
      ],
      child: BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => _DashboardLayout(
            locations: Location(lokasi: [], maps: [], events: []),
          ),
          loaded: (location) => _DashboardLayout(
            locations: location,
          ),
          orElse: () => _DashboardLayout(
            locations: Location(lokasi: [], maps: [], events: []),
          ),
        ),
      ),
    );
  }
}

class _DashboardLayout extends StatefulWidget {
  final Location locations;

  const _DashboardLayout({Key? key, required this.locations}) : super(key: key);

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
        title: 'Lokasi Unit'.text.color(Colors.white).xl.make(),
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: showLocation,
          zoom: 10.0,
        ),
        markers: getmarkers(widget.locations),
        mapType: MapType.normal,
      ),
    );
  }

  Set<Marker> getmarkers(Location location) {
    setState(() {
      for (var y in location.maps) {
        markers.add(
          Marker(
            markerId: MarkerId(Random().nextInt(100).toString()),
            position: LatLng(y.latitude, y.longitude),
          ),
        );
      }
    });

    return markers;
  }
}
