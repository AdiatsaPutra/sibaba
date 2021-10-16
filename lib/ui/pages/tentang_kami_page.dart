import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/tentang_cubit.dart';
import 'package:sibaba/models/tentang_model.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.h),
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
                                  children: [
                                    Text(
                                      tentangModel.profiles.sejarah,
                                      style: darkRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(defaultMargin),
                                child: Column(
                                  children: [
                                    Text(
                                      tentangModel.profiles.struktur,
                                      style: darkRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(defaultMargin),
                                child: Column(
                                  children: [
                                    Text(
                                      tentangModel.profiles.visimisi,
                                      style: darkRegular,
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
