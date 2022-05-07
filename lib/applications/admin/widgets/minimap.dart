import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

import '../bloc/maps/maps_cubit.dart';

class Minimap extends StatelessWidget {
  const Minimap({Key? key, required this.latLng}) : super(key: key);

  final List<LatLng> latLng;

  @override
  Widget build(BuildContext context) {
    Logger().i(latLng);
    return BlocProvider(
      create: (context) => MapsCubit(),
      child: _MinimapBody(
        latLng: latLng,
      ),
    );
  }
}

class _MinimapBody extends StatelessWidget {
  const _MinimapBody({Key? key, required this.latLng}) : super(key: key);

  final List<LatLng> latLng;

  @override
  Widget build(BuildContext context) {
    final mapsCubit = context.read<MapsCubit>();
    return Container(
      height: 130,
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
              mapType: MapType.satellite,
              onMapCreated: (controller) {
                mapsCubit.createController(controller);
              },
              markers: mapsCubit.markers,
            ),
          );
        },
      ),
    );
  }
}
