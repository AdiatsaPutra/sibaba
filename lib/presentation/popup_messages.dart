import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PopupMessages {
  static successPopup(String message) {
    Get.snackbar('Berhasil', message,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
        boxShadows: [
          const BoxShadow(),
        ]);
  }

  static errorPopup(String message) {
    Get.snackbar('Gagal', message,
        backgroundColor: Colors.red,
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
        boxShadows: [
          const BoxShadow(),
        ]);
  }

  static confirmDeletePopup(BuildContext context, VoidCallback onTap) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: VStack([
          'Anda yakin akan menghapus data ini?'
              .text
              .base
              .isIntrinsic
              .makeCentered(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: 'Batal'.text.base.make(),
              ).box.width(100).make(),
              ElevatedButton(
                onPressed: onTap,
                child: 'Hapus'.text.base.make(),
              ).box.width(100).make(),
            ],
          )
        ]).p16(),
      ),
    );
  }
}
