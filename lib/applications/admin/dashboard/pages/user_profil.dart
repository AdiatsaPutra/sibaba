import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfil extends StatelessWidget {
  const UserProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Edit Profil'.text.base.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: VStack([
        const SizedBox(height: 10),
        'Nama'.text.base.bold.make(),
        TextFormField(
          controller: TextEditingController(),
          decoration: const InputDecoration(hintText: 'Masukkan Nama'),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == "") {
              return 'Masukkan Nama';
            }
          },
        ),
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
        'Konfirmasi Password'.text.base.bold.make(),
        TextFormField(
          controller: TextEditingController(),
          decoration:
              const InputDecoration(hintText: 'Masukkan Konfirmasi Password'),
          validator: (value) {
            if (value == "") {
              return 'Masukkan Konfirmasi Password';
            }
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {},
            child: 'Edit Profil'.text.color(Colors.white).base.make()),
      ]).p16(),
    );
  }
}
