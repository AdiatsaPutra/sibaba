import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:sibaba/ui/widgets/lokasi_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25.sp,
                  ),
                ),
                BlocConsumer<LokasiCubit, LokasiState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is LokasiFetched) {
                      List<LokasiModel> lokasi = state.lokasi;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lokasi.length,
                        itemBuilder: (context, index) {
                          return LokasiCard(
                            nama: lokasi[index].nama ?? '-',
                            alamat: lokasi[index].alamat ?? '-',
                            akreditasi: lokasi[index].akreditasi ?? '-',
                            telpUnit: lokasi[index].telpUnit ?? '-',
                            email: lokasi[index].email ?? '-',
                            status: lokasi[index].status ?? '-',
                            // fotoPath: lokasi[index].photo!.fileLoc,
                            slug: lokasi[index].locSlug!,
                          );
                        },
                      );
                    } else if (state is LokasiError) {
                      return const Text('Error');
                    } else {
                      return const Loader(
                        height: 200,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  final int height;

  const Loader({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Container(
                height: height.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white);
      },
    );
  }
}
