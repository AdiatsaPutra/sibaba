import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sibaba/applications/admin/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:sibaba/applications/admin/models/user.dart';
import 'package:sibaba/injection.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfilPage extends StatelessWidget {
  final User user;
  const UserProfilPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileCubit>(),
      child: _UserProfileLayout(user: user),
    );
  }
}

class _UserProfileLayout extends StatelessWidget {
  final User user;
  const _UserProfileLayout({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        title: 'Edit Profil'.text.base.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
              Get.back();
            },
            child: const Icon(Icons.logout, color: Colors.red),
          ).pOnly(right: 20),
        ],
      ),
      body: VStack([
        const SizedBox(height: 10),
        'Nama'.text.base.bold.make(),
        TextFormField(
          controller: cubit.name..text = user.name,
          decoration: const InputDecoration(hintText: 'Masukkan Nama'),
          validator: (value) {
            if (value == "") {
              return 'Masukkan Nama';
            }
          },
        ),
        const SizedBox(height: 10),
        'Email'.text.base.bold.make(),
        TextFormField(
          controller: cubit.email..text = user.email,
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
          controller: cubit.password,
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
          controller: cubit.confirmPassword,
          decoration:
              const InputDecoration(hintText: 'Masukkan Konfirmasi Password'),
          validator: (value) {
            if (value != cubit.password.text) {
              return 'Password dan Konfirmasi Password Tidak Sama';
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
