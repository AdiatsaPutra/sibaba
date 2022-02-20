import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart';
import 'package:sibaba/presentation/loading_indicator.dart';
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
      backgroundColor: Colors.white,
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
      child: ZStack(
        [
          const SizedBox(height: 10),
          VStack([
            const SizedBox(height: 100),
            BlocBuilder<InfoLokasiCubit, InfoLokasiState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => const LoadingIndicator(
                  isSearchable: true,
                  isScrollable: true,
                ),
                error: (message) => message.text.base.makeCentered(),
                loaded: (locations) => VStack(locations
                    .map((e) => LocationCard(location: e).p16())
                    .toList()),
                orElse: () => const SizedBox(),
              ),
            ),
          ]).scrollVertical(),
          VxBox().width(Get.width).height(100).color(Colors.white).make(),
          TextFormField(
            controller: context.read<InfoLokasiCubit>().searchKeyword,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
            onChanged: (value) =>
                context.read<InfoLokasiCubit>().searchInfoLokasi(),
          ).p16(),
        ],
      ),
    );
  }
}
