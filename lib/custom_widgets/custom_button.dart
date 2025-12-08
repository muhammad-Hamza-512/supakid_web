import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool showIcon;
  final double? padding;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showIcon = true,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 20.0.h),
      child: Container(
        width: AppStyles.width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: isLoading
              ? []
              : const [
            BoxShadow(
              color: kBlackColor,
              offset: Offset(0, 10),
              blurRadius: 0,
              spreadRadius: -4,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 18.h),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (!isLoading)
                Center(
                  child: Text(
                    text,
                    style: AppStyles.interStyle(kWhiteColor, 16, FontWeight.w700),
                  ),
                ),
              if (isLoading)
                Center(
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              if (showIcon && !isLoading)
                Positioned(
                  right: 38.w,
                  child: Image.asset(kRightArrow, width: 26.w),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
