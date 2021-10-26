import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/models/tentang_model.dart';
import 'package:sibaba/ui/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/formatted_text.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Tentang kami',
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    height: 200.h,
                    width: 200.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBar(
                      indicatorColor: Colors.yellow,
                      labelColor: Colors.black,
                      labelStyle: darkRegular.copyWith(fontSize: 13.sp),
                      tabs: const [
                        Tab(
                          text: 'Sejarah',
                        ),
                        Tab(
                          text: 'Struktur',
                        ),
                        Tab(
                          text: 'Visi dan Misi',
                        ),
                      ],
                    ),
                  ],
                ),
                BlocBuilder<TentangCubit, TentangState>(
                  builder: (context, state) {
                    if (state is TentangFetched) {
                      TentangModel tentangModel = state.tentangModel;
                      return Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(defaultMargin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormattedText(
                                      text: tentangModel.profiles.sejarah,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(defaultMargin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormattedText(
                                      text: tentangModel.profiles.struktur,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(defaultMargin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormattedText(
                                      text: tentangModel.profiles.visimisi,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is TentangError) {
                      return const Text('Error');
                    } else {
                      return const Center(child: CircularProgressIndicator());
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
