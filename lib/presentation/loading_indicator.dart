import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isScrollable;
  final bool isSearchable;
  const LoadingIndicator(
      {Key? key, this.isSearchable = false, this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator().centered();
  }
}
