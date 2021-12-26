import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/cubit/kapanewon_cubit.dart';
import 'package:sibaba/models/kapanewon_model.dart';
import 'package:sibaba/presentation/core.dart';
import 'package:sibaba/presentation/style.dart';
import 'package:sibaba/presentation/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class KelurahanPage extends StatefulWidget {
  final TextEditingController areaNameController = TextEditingController();
  final TextEditingController kodeAreaController = TextEditingController();
  KelurahanPage({Key? key}) : super(key: key);

  @override
  _KelurahanPageState createState() => _KelurahanPageState();
}

class _KelurahanPageState extends State<KelurahanPage> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Kelurahan",
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 180.h,
                width: Get.width.w,
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Core.showPopupDialog(
                                context,
                                'Tambah Kelurahan',
                                buildAddKelurahan(widget.areaNameController,
                                    widget.kodeAreaController));
                          },
                          child: Text(
                            'Tambah Kelurahan',
                            style: whiteSmall,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Print',
                                style: whiteSmall,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Excel',
                                style: whiteSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<KapanewonCubit, KapanewonState>(
                    builder: (context, state) {
                      if (state is KapanewonFetched) {
                        List<KapanewonModel> kapanewon = state.kapanewonModel;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            color: Colors.white,
                            child: DataTable(
                              showBottomBorder: true,
                              columns: <DataColumn>[
                                DataColumn(
                                  label: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onSort: (columnIndex, _) {
                                    setState(() {
                                      _currentSortColumn = columnIndex;
                                      if (_isAscending == true) {
                                        _isAscending = false;
                                        kapanewon.sort((kapanewonA,
                                                kapanewonB) =>
                                            kapanewonB.areaId!
                                                .compareTo(kapanewonA.areaId!));
                                      } else {
                                        _isAscending = true;
                                        kapanewon.sort((kapanewonA,
                                                kapanewonB) =>
                                            kapanewonA.areaId!
                                                .compareTo(kapanewonB.areaId!));
                                      }
                                    });
                                  },
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Nama',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'KodePos',
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'Action',
                                  ),
                                ),
                              ],
                              rows: kapanewon
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                            (e.key.toInt() + 1).toString())),
                                        DataCell(
                                            Text(e.value.areaName.toString())),
                                        DataCell(
                                            Text(e.value.kodeArea.toString())),
                                        DataCell(
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow),
                                                onPressed: () {
                                                  Core.showPopupDialog(
                                                    context,
                                                    'Edit Data',
                                                    Text('data'),
                                                  );
                                                },
                                                child: Text('Edit'),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red),
                                                onPressed: () {
                                                  Core.confirmPopup(
                                                      'Delete data',
                                                      'Anda yakin akan menghapus data ini?',
                                                      () {
                                                    context
                                                        .read<KapanewonCubit>()
                                                        .deleteKapanewon(7);
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  }, () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  });
                                                },
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      } else if (state is KapanewonError) {
                        return Text(state.message.toString());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildAddKelurahan(
    TextEditingController areaNameController,
    TextEditingController kodeAreaController,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            textEditingController: areaNameController,
            label: 'Nama',
            hintText: 'Masukkan Nama',
          ),
          CustomTextField(
            textEditingController: kodeAreaController,
            label: 'Kode Pos',
            hintText: 'Masukkan Kode Pos',
            textInputType: TextInputType.number,
          ),
          SizedBox(
            width: Get.width,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                if (areaNameController.text == "" ||
                    kodeAreaController.text == "") {
                  Get.snackbar('Data masih kosong', 'Masukkan data yang benar');
                } else {
                  context.read<KapanewonCubit>().addKapanewon(
                      areaName: areaNameController.text,
                      kodeArea: kodeAreaController.text);
                  context.read<KapanewonCubit>().getKapanewon();
                  Get.snackbar(
                      'Berhasil', 'Data kapanewon berhasil ditambahkan');
                  setState(() {
                    areaNameController.text = "";
                    kodeAreaController.text = "";
                  });
                }
              },
              child: Text(
                'Simpan',
                style: whiteRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
