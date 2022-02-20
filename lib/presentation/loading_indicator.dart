import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isScrollable;
  final bool isSearchable;
  const LoadingIndicator(
      {Key? key, this.isSearchable = false, this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (isScrollable == true) {
        return const CircularProgressIndicator()
            .centered()
            .expand()
            .box
            .height(isSearchable
                ? Get.height / 1.5
                : Get.height - AppBar().preferredSize.height)
            .make();
      }
      return const CircularProgressIndicator().centered().expand();
    });
  }
}
