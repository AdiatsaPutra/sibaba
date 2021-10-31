import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibaba/core/core.dart';
import 'package:sibaba/core/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibaba/cubit/message_cubit.dart';

class PesanTile extends StatelessWidget {
  final int? id;
  final String? fullName;
  final String? email;
  final String? noHP;
  final String? pesan;

  const PesanTile(
      {Key? key, this.id, this.fullName, this.email, this.noHP, this.pesan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          fullName!,
          style: darkRegular,
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email!,
                  style: darkRegular,
                ),
                Text(
                  noHP!,
                  style: darkRegular,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  pesan!,
                  style: darkRegular,
                ),
                TextButton(
                  onPressed: () {
                    Core.confirmPopup(
                        'Hapus Data', 'Anda yakin akan menghapus data ini?',
                        () {
                      BlocProvider.of<MessageCubit>(context, listen: false)
                          .deleteMessage(id!);
                      Navigator.of(context, rootNavigator: true).pop();
                    }, () {
                      Navigator.of(context, rootNavigator: true).pop();
                    });
                  },
                  child: Text(
                    'Hapus',
                    style: darkRegular.copyWith(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
