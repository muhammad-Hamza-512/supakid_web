import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_images.dart';
import 'back_button.dart';


class AllCustomHeader extends StatelessWidget {
  const AllCustomHeader({ super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButtonWidget(),
        Expanded(
          child: Center(
            child: Image.asset(
              kSupaLogo,
              width: 125.w,
            ),
          ),
        ),
        SizedBox(width: 50.w),
      ],
    );
  }
}
