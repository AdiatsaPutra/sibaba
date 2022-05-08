import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../applications/admin/bloc/maps/maps_cubit.dart';

class Minimap extends StatelessWidget {
  const Minimap({Key? key, required this.latLng}) : super(key: key);

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit()..setInitialPosition(latLng),
      child: _MinimapBody(
        latLng: latLng,
      ),
    );
  }
}

class _MinimapBody extends StatelessWidget {
  const _MinimapBody({Key? key, required this.latLng}) : super(key: key);

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    final mapsCubit = context.read<MapsCubit>();
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: BlocBuilder<MapsCubit, MapsState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: GoogleMap(
              initialCameraPosition: mapsCubit.initialPosition,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (controller) {
                mapsCubit.createController(controller);
                mapsCubit.changeMarkerposition(latLng);
              },
              markers: mapsCubit.markers,
            ),
          );
        },
      ),
    );
  }
}
