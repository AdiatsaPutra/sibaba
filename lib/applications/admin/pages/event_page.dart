import 'package:flutter/material.dart';
import 'package:sibaba/presentation/color_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Event'.text.base.color(Colors.white).make(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: const VStack([]).p16(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        label: HStack([
          const Icon(Icons.add),
          'Tambah Event'.text.base.make(),
        ]),
        onPressed: () {},
      ),
    );
  }
}
