import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/cubit/lokasi_cubit.dart';
import 'package:sibaba/cubit/user_cubit.dart';
import 'package:sibaba/presentation/style.dart';
import 'package:sibaba/ui/pages/superadmin/home_superadmin_page.dart';
import 'package:sibaba/ui/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
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
                CustomTextField(
                  textEditingController: nameController,
                  label: 'Nama',
                  hintText: 'Masukkan Nama Anda',
                ),
                CustomTextField(
                  textEditingController: emailController,
                  label: 'Email',
                  hintText: 'Masukkan Email',
                ),
                CustomTextField(
                  textEditingController: passwordController,
                  label: 'Password',
                  hintText: 'Password (Minimal 8 Karakter)',
                ),
                CustomTextField(
                  textEditingController: confirmPasswordController,
                  label: 'Konfirmasi Password',
                  hintText: 'Konfirmasi Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  height: 40.h,
                  child: isLoading == true
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white)
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            if (nameController.text == "" ||
                                emailController.text == "" ||
                                passwordController.text == "" ||
                                confirmPasswordController.text == "") {
                              Get.snackbar('Gagal', 'Isi data yang kosong');
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
                              Get.snackbar('Gagal',
                                  'Password dan konfirmasi password tidak sama');
                            } else {
                              context.read<UserCubit>().register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text);
                              context.read<UserCubit>().getUsers();
                              context.read<LokasiCubit>().getLokasi();
                              Get.to(() => const HomeSuperadminPage());
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Text(
                            'Daftar',
                            style: whiteRegular,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
