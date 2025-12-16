import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../custom_widgets/custom_button.dart';
import '../utils/app_images.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body : Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.h),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Image.asset(kSupaLogo, width: 150.w,),
              const Spacer(),
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(kSuccessIMG, width: 130.w, color: kPrimaryColor,),
                      const Positioned(
                          bottom: 0,
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Icon(Icons.check, size: 70, color: kWhiteColor,))
                    ],
                  ),
                  SizedBox(height: 24.h,),
                  Text("Payment Successful!", style: AppStyles.interStyle(kBlackColor, 24, FontWeight.w700)),
                  // SizedBox(height: 11.h,),
                  // Center(child: Text("Your subscription has been activated", style: AppStyles.interStyle(kGreyColor, 18, FontWeight.w500))),
                  SizedBox(height: 11.h,),
                  Text(textAlign: TextAlign.center,
                      "We’re confirming your payment and setting up your subscription.\n"
                  "This usually takes just a few seconds.\n\n"
                  "Please keep the app open.",
                      style: AppStyles.interStyle(kGreyColor, 14, FontWeight.w500)),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: "Back to App",
                onPressed: () {},
                padding: 0,
                showIcon: false,
              ),
              SizedBox(height: 30.h,),

            ],
          ),
        ),
      )
    );
  }
}
