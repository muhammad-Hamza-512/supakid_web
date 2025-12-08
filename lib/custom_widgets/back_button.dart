import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_images.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? color;
  final double size;

  const BackButtonWidget({
    super.key,
    this.color,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(kBackIcon, width: size * 0.6),
        ),
      ),
    );
  }
}
