import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SuccessDialog extends StatelessWidget {
  final String image;
  final String message;

  const SuccessDialog({Key? key, required this.image, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: VStack([
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        ).centered(),
        message.text.lg.makeCentered().py8(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: 'Ok'.text.base.color(Colors.white).make(),
        )
      ]).p16(),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
