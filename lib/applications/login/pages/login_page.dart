import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/dashboard/dashboard.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: VStack([
        Image.asset('assets/logo.png')
            .box
            .width(Get.width / 3)
            .height(Get.height / 3)
            .makeCentered(),
        Form(
          key: GlobalKey<FormState>(),
          child: VStack([
            const SizedBox(height: 10),
            'Email'.text.base.bold.make(),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(hintText: 'Masukkan Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == "") {
                  return 'Masukkan Email';
                }
              },
            ),
            const SizedBox(height: 10),
            'Password'.text.base.bold.make(),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(hintText: 'Masukkan Pesan'),
              validator: (value) {
                if (value == "") {
                  return 'Masukkan Pesan';
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const DashboardPage());
              },
              child: 'Masuk'.text.color(Colors.white).base.make(),
            )
          ]).p16(),
        )
      ]).scrollVertical(),
    );
  }
}
