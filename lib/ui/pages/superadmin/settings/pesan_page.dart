import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sibaba/core/style.dart';
import 'package:sibaba/cubit/message_cubit.dart';
import 'package:sibaba/models/message_model.dart';
import 'package:sibaba/ui/widgets/custom_appbar.dart';
import 'package:sibaba/ui/widgets/pesan_tile.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Pesan',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder<MessageCubit, MessageState>(
                  builder: (context, state) {
                    if (state is MessageFetched) {
                      List<MessageModel> message = state.messageModel;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: message.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PesanTile(
                            fullName: message[index].fullname,
                            id: message[index].messageId,
                            email: message[index].email,
                            noHP: message[index].phone,
                            pesan: message[index].message,
                          );
                        },
                      );
                    } else if (state is MessageError) {
                      return Text(state.message.toString());
                    } else {
                      return const CircularProgressIndicator();
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
