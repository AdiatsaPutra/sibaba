import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:sibaba/applications/info_lokasi/ui/widgets/location_card.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../injection.dart';

class InfoLokasiPage extends StatelessWidget {
  const InfoLokasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Lokasi Badko',
      ),
      body: BlocProvider(
        create: (context) => getIt<InfoLokasiCubit>()..getLocations(),
        child: const InfoLokasiScreen(),
      ),
    );
  }
}

class InfoLokasiScreen extends StatelessWidget {
  const InfoLokasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<InfoLokasiCubit>().getLocations(),
      child: VStack(
        [
          TextFormField(
            controller: context.read<InfoLokasiCubit>().searchKeyword,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
            onChanged: (value) =>
                context.read<InfoLokasiCubit>().searchInfoLokasi(),
          ),
          const SizedBox(height: 10),
          BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircularProgressIndicator().centered(),
              loaded: (locations) => VStack(
                  locations.map((e) => LocationCard(location: e)).toList()),
              orElse: () => const SizedBox(),
            ),
          ),
        ],
      ).p16().scrollVertical(),
    );
  }
}
