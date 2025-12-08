import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Container(
            height: 22.h,
            width: 22.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kWhiteColor,
            ),
            child: Center(
              child: Icon(icon, size: 14.h, color: kPrimaryColor),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(text, style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}