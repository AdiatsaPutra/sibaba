import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class KategoriItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const KategoriItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VStack(
        [
          VxBox(child: Icon(icon, size: 35))
              .width(50)
              .height(50)
              .color(const Color(0xFF6C63FF).withOpacity(0.1))
              .rounded
              .make(),
          const SizedBox(height: 10),
          title.text.base.bold.make(),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
