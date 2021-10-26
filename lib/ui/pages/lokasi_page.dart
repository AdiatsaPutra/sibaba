import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/models/lokasi_model.dart';
import 'package:sibaba/ui/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/loader.dart';
import 'package:sibaba/ui/widgets/lokasi_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Lokasi Badko',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Cari Lokasi",
                      hintStyle: darkRegular,
                      contentPadding: const EdgeInsets.all(defaultMargin),
                      border: InputBorder.none,
                    ),
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
