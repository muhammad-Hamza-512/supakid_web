import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/feature_items.dart';
import '../custom_widgets/loading.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';
import 'controller/subscription_controller.dart';

class AllPlansScreen extends GetView<SubscriptionController> {
  const AllPlansScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                Center(
                  child: Image.asset(
                    kSupaLogo,
                    width: 125.w,
                  ),
                ),
                SizedBox(height: 15.h),
                 Text("Choose the plan that fits your family's needs",
                      style: AppStyles.interStyle(kBlackColor, 20, FontWeight.w800),
                ),
                SizedBox(height: 5.h),
                Text("To continue, please choose a subscription plan.",
                    style: AppStyles.interStyle(kMidGreyColor, 14, FontWeight.w500)),
                SizedBox(height: 30.h),
                Text("Select Your Plan",
                    style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w800)),
                SizedBox(height: 20.h),
                Obx(() {
                  bool isLoading = controller.plans.isEmpty;
                  return Skeletonizer(
                    enabled: isLoading,
                    child: Wrap(
                      runSpacing: 16.h,
                      children: List.generate(isLoading ? 3 : controller.plans.length, (index) {
                        var data = isLoading
                            ? {'planName': '', 'planDetails': {'amount': null, 'interval': '', 'childProfiles': 0}}
                            : controller.plans[index];
                        String planName = data['planName'] ?? '';
                        var planDetails = data['planDetails'] ?? {};
                        bool isSelected = controller.selectedPlan.value == data;

                        return GestureDetector(
                          onTap: isLoading
                              ? null
                              : () {
                            controller.selectedPlan.value = isSelected ? null : data;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                              borderRadius: AppStyles.customBorderAll8,
                              gradient: isSelected
                                  ? _buildRedGradient()
                                  : _buildBlueGradient(),
                            ),
                            padding: EdgeInsets.all(16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  planName,
                                  style: AppStyles.interStyle(kWhiteColor, 18, FontWeight.w800),
                                ),
                                SizedBox(height: 12.h),
                                Text(planDetails['amount'] != null
                                      ? '\$${planDetails['amount']} ${planDetails['interval'] == 'month' ? '/month' : '/year'} '
                                      : "No Price",
                                  style: AppStyles.interStyle(kWhiteColor, 24, FontWeight.w700),
                                ),
                                SizedBox(height: 16.h),
                                FeatureItem(icon: Icons.person_add, text: "Create up to ${planDetails['childProfiles']} child profiles"),
                                const FeatureItem(icon: Icons.lock, text: "Add restrictions to child profiles"),
                                const FeatureItem(icon: Icons.timer, text: "Set screen time limits"),
                                const FeatureItem(icon: Icons.category, text: "Content category filters"),
                                const FeatureItem(icon: Icons.history, text: "View activity history"),
                                const FeatureItem(icon: Icons.notifications, text: "Usage alerts and notifications"),
                                Text((planDetails['interval'] == 'year' ? " +2 months free" : ""),style:
                                  AppStyles.interStyle(kWhiteColor, 18, FontWeight.bold)
                                  ,),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),
                SizedBox(height: 50.h),
                CustomButton(
                  text: "Next",
                  onPressed: () {
                    if (controller.selectedPlan.value == null) {
                     showToast(context, msg: "Please select a plan before proceeding.");
                    } else {
                      Get.toNamed(kPaymentSummaryRoute, arguments: {
                        'selectedPlan': controller.selectedPlan.value,
                        // 'subscriptionData': Get.arguments['data'],
                      });
                    }
                  },
                  padding: 0,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient _buildBlueGradient() => const LinearGradient(
    begin: Alignment(-0.8, -0.8),
    end: Alignment(0.8, 0.8),
    colors: [Color(0xff1A9CE8), Color(0xff38B6FF), Color(0xff7AD0FF)],
  );

  LinearGradient _buildRedGradient() => const LinearGradient(
    begin: Alignment(-0.8, -0.8),
    end: Alignment(0.8, 0.8),
    colors: [Color(0xFFC04A4A), Color(0xFFA02828), Color(0xFF781E1E)],
  );
}




