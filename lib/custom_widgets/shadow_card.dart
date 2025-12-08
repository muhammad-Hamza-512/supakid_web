import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ShadowCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? bgColor;

  const ShadowCard({
    super.key,
    required this.child,
    this.height,
     this.width,
     this.borderRadius,
     this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? AppStyles.width(context),
      decoration: BoxDecoration(
        color: bgColor ?? kCardColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 28),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
