import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakid_web/custom_widgets/custom_button.dart';
import '../../../../utils/app_styles.dart';
import '../../../services/storage.dart';
import '../custom_widgets/custom_header.dart';
import '../custom_widgets/loading.dart';
import '../custom_widgets/shadow_card.dart';
import '../utils/app_colors.dart';
import 'controller/subscription_controller.dart';

class PaymentSummaryScreen extends GetView<SubscriptionController> {
  const  PaymentSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = Get.arguments ?? {};
    // final selectedPlan = args['selectedPlan'];
    final selectedPlan = Get.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              const AllCustomHeader(),
              SizedBox(height: 15.h,),
              Text("Order Summary", style: AppStyles.interStyle(kBlackColor , 18, FontWeight.w700,),),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  // print(subscriptionData);
                },
                child: ShadowCard(
                  borderRadius: 12,
                  child: Padding(
                    padding:  EdgeInsets.all(16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Selected Plan:", style: AppStyles.interStyle(kMidGreyColor, 16, FontWeight.w600)),
                            Text("${selectedPlan?['planName'] ?? "NO"}", style: AppStyles.interStyle(kPrimaryColor, 16, FontWeight.w700)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Billing Cycle:", style: AppStyles.interStyle(kMidGreyColor, 16, FontWeight.w600)),
                            Text(
                              "${selectedPlan?['planDetails']['interval'][0].toUpperCase()}${selectedPlan?['planDetails']['interval'].substring(1)}"
                                  "${selectedPlan?['planDetails']['interval'] == 'year' ? ' + 2 Months free' : ''}",
                              style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Child Profiles:", style: AppStyles.interStyle(kMidGreyColor, 16, FontWeight.w600)),
                            Text("${selectedPlan?['planDetails']['childProfiles']} Profiles", style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w500)),
                          ],
                        ),
                        Divider(height: 30.h, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount:", style: AppStyles.interStyle(kBlackColor, 18, FontWeight.w700)),
                            Text('\$${selectedPlan?['planDetails']['amount']}',
                              style: AppStyles.interStyle(kPrimaryColor, 18, FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: "Pay Now",
                onPressed: () {

                  if (selectedPlan == null) {
                    showToast(context, msg: "Please select a plan first");
                    return;
                  }

                  final planId = selectedPlan['planDetails']['planId'];
                  log("Selected Plan ID: $planId");

                  controller.startCheckout(planId);
                },
              ),
              SizedBox(height: 30.h,),
            ],
          ),
        ),
      ),
    );
  }
}