import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loader extends StatelessWidget {
  final int height;

  const Loader({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                height: height.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white);
      },
    );
  }
}
