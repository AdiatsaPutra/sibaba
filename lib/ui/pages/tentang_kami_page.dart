import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';

class TentangKamiPage extends StatelessWidget {
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
                    decoration: BoxDecoration(
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
                      tabs: [
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
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(defaultMargin),
                          child: Column(
                            children: [
                              Text(
                                'Pengajian anak-anak di Yogyakarta mulai dirintis pada tahun 1953 dengan didirikannya Persatuan Pengajian Anak-Anak Kotagede dan sekitarnya (PPKS). Selanjutnya diikuti pada tahun 1963 didirikan Badan Koordinasi Pengajian Anak-Anak (BAKOPA). Tujuan BAKOPA pada dasarnya sama dengan PPKS namun lingkup wilayahnya lebih luas, yakni meliputi seluruh wilayah Yogyakarta bahkan banyak cabang-cabangnya yang berdiri di luar DIY. Pada tahun 1983 diadakan pertemuan para aktivis pengajian anak-anak Kotagede dan sekitarnya untuk membicarakan problematika pengajian anak¬-anak yang dirasakan sejak tahun 1970-an dalam keadaan yang tidak stabil, bahkan tidak sedikit yang macet. Hasil dari pertemuan tersebut terbentuklah Tim Pembina Pengajian Anak-Anak yang pada awalnya bergerak di Kotagede. Setelah melalui beberapa penelitian dan pengamatan yang dilakukan Tim, maka Tim mengambil sebuah kesimpulan dibutuhkannya sebuah bentuk baru bagi sistem dan metode pengajaran membaca Al-Qur’an, yang dapat dijadikan terobosan untuk mengatasi problem yang terjadi. Pada tanggal 16 Maret 1988 K.H As’ad Humam (Alm) bersama teman-teman Team Tadarus Angkatan Muda Masjid & Mushola (AMM) Yogyakarta mendirikan TKA (Taman Kanak-Kanak Al-Qur’an). Setelah TKA ini berlangsung 1 tahun dan menunjukkan hasil yang menggembirakan maka didirikanlah TPA (Taman Pendidikan Al-Qur’an) yang dikhususkan anak usia SD atau lulusan dari TKA. Dari tahun ke tahun TKA-TPA terus mengalami peningkatan di berbagai daerah bahkan hampir di setiap masjid memiliki TKA-TPA. Hal ini sangat menggembirakan bagi kalangan aktitis TKA-TPA, namun di sisi lain ada sebuah beban berat yang harus diemban oleh para aktivis dengan bertambah banyaknya TKA-TPA yang berdiri, yaitu bagaimana menangani, mengkoordinir, dan mengelola TKA-TPA agar menejemen dan kegiatan pembelajarannya berkualitas dan berkesinambungan. Dan sebuah musyawarah yang dilakukan oleh para aktivis TKA-TPA yang ada, diambil sebuah keputusan yaitu membuat sebuah wadah sebagai wahana koordinasi pembinaan, komunikasi dan kerjasama TKA-TPA, yang sekarang dikenal dengan nama BADKO atau Badan Koordinasi. BADKO tepatnya berdiri pada tanggal 28 Oktober 1990.',
                                style: darkRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
