import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supakid_web/custom_widgets/custom_button.dart';
import '../../../../utils/app_styles.dart';
import '../../../services/storage.dart';
import '../custom_widgets/custom_header.dart';
import '../custom_widgets/shadow_card.dart';
import '../utils/app_colors.dart';
import 'controller/subscription_controller.dart';

class PaymentSummaryScreen extends GetView<SubscriptionController> {
  const   PaymentSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final selectedPlan = args['selectedPlan'];
    // final subscriptionData = args['subscriptionData'];

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
                            Text("${selectedPlan['planName']}", style: AppStyles.interStyle(kPrimaryColor, 16, FontWeight.w700)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Billing Cycle:", style: AppStyles.interStyle(kMidGreyColor, 16, FontWeight.w600)),
                            Text(
                              "${selectedPlan['planDetails']['interval'][0].toUpperCase()}${selectedPlan['planDetails']['interval'].substring(1)}"
                                  "${selectedPlan['planDetails']['interval'] == 'year' ? ' + 2 Months free' : ''}",
                              style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Child Profiles:", style: AppStyles.interStyle(kMidGreyColor, 16, FontWeight.w600)),
                            Text("${selectedPlan['planDetails']['childProfiles']} Profiles", style: AppStyles.interStyle(kBlackColor, 16, FontWeight.w500)),
                          ],
                        ),
                        Divider(height: 30.h, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount:", style: AppStyles.interStyle(kBlackColor, 18, FontWeight.w700)),
                            Text('\$${selectedPlan['planDetails']['amount']}',
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
              CustomButton(text: "Pay Now", onPressed: (){},
                showIcon: false,
                padding: 0,
              )
              // CustomButton(
              //     text: "Pay Now",
              //     showIcon: false,
              //   onPressed: () async {
              //     final isUpgrade = subscriptionData != null;
              //     final data = {
              //       "name": userSD['name'],
              //       "email": userSD['email'],
              //       "userId": userSD['id'],
              //     };
              //
              //     showLoader(context, isUpgrade ? "Upgrading subscription..." : "Preparing payment...");
              //
              //     try {
              //       final setupResponse = await controller.subscriptionServices.createIntent(data);
              //
              //       log("CreateIntent Response: $setupResponse");
              //
              //       if (setupResponse['status'] == 'success') {
              //         final clientSecret = setupResponse['data']['client_secret'];
              //         final stripeCustomerId = setupResponse['stripeCustomerId'];
              //
              //         await Stripe.instance.initPaymentSheet(
              //           paymentSheetParameters: SetupPaymentSheetParameters(
              //             merchantDisplayName: 'Mubarak',
              //             customerId: stripeCustomerId,
              //             setupIntentClientSecret: clientSecret,
              //             style: ThemeMode.light,
              //           ),
              //         );
              //
              //         Get.back();
              //         await Stripe.instance.presentPaymentSheet();
              //
              //         showLoader(Get.overlayContext!, isUpgrade ? "Finalizing upgrade..." : "Finalizing subscription...");
              //
              //         final setupIntentId = setupResponse['data']['id'];
              //         final priceId = selectedPlan['planDetails']['planId'];
              //
              //         if (isUpgrade) {
              //           // === UPGRADE FLOW ===
              //           final stripeSubscriptionId = subscriptionData['stripeSubscriptionId'];
              //
              //           log("Upgrading subscription for userId: ${userSD['id']}, stripeSubscriptionId: $stripeSubscriptionId, new priceId: $priceId");
              //
              //           final upgradeRes = await controller.subscriptionServices.upgradeSubscription({
              //             "userId": userSD['id'],
              //             "stripeSubscriptionId": stripeSubscriptionId,
              //             "priceId": priceId,
              //           });
              //
              //           log("Upgrade Response: $upgradeRes");
              //
              //           Get.back();
              //
              //           if (upgradeRes['status'] == 'success') {
              //             userSD['subscriptionStatus'] = 'active';
              //             userSD['stripeCustomerId'] = stripeCustomerId;
              //             userSD['childProfileLimit'] = selectedPlan['planDetails']['childProfiles'];
              //
              //             await Storage.setLogin(userSD);
              //             await Storage.setLogin(userSD);
              //             showToast(Get.overlayContext!, msg: "Subscription upgraded successfully", duration: 2);
              //             Get.offNamed(kPaymentSuccessRoute);
              //           } else {
              //             showToast(Get.overlayContext!, msg: "Upgrade failed", duration: 2);
              //           }
              //         } else {
              //           // === NEW SUBSCRIPTION FLOW ===
              //           // log("Creating new subscription for userId: ${userSD['id']}, setupIntentId: $setupIntentId, priceId: $priceId");
              //
              //           final subscriptionResponse = await controller.subscriptionServices.subscription({
              //             "userId": userSD['id'],
              //             "priceId": priceId,
              //             "setupIntentId": setupIntentId,
              //           });
              //
              //           // log("New Subscription Response: $subscriptionResponse");
              //
              //           Get.back();
              //
              //           if (subscriptionResponse['status'] == 'success') {
              //             userSD['subscriptionStatus'] = 'active';
              //             userSD['stripeCustomerId'] = stripeCustomerId;
              //             userSD['childProfileLimit'] = selectedPlan['planDetails']['childProfiles'];
              //
              //             await Storage.setLogin(userSD);
              //
              //             showToast(Get.overlayContext!, msg: "Subscription created successfully", duration: 2);
              //             Get.offNamed(kPaymentSuccessRoute);
              //           } else {
              //             showToast(Get.overlayContext!, msg: "Failed to create subscription", duration: 2);
              //           }
              //         }
              //       } else {
              //         Get.back();
              //         showToast(Get.overlayContext!, msg: "Failed to create setup intent", duration: 2);
              //       }
              //     } catch (e) {
              //       Get.back();
              //       log("Payment error: $e");
              //       showToast(Get.overlayContext!, msg: "Payment failed. ${e.toString()}", duration: 2);
              //     }
              //   },
              //
              //   // onPressed: () async {
              //   //   final data = {
              //   //     "name": userSD['name'],
              //   //     "email": userSD['email'],
              //   //     "userId": userSD['id'],
              //   //   };
              //   //   showLoader(context, "Preparing payment...");
              //   //
              //   //   try {
              //   //     final setupResponse = await controller.subscriptionServices.createIntent(data);
              //   //
              //   //     log("Setup Response====================>>>>>>>>>>>>>>>>>>>>>>: $setupResponse");
              //   //
              //   //     if (setupResponse['status'] == 'success') {
              //   //       final clientSecret = setupResponse['data']['client_secret'];
              //   //       final stripeCustomerId = setupResponse['stripeCustomerId'];
              //   //
              //   //       await Stripe.instance.initPaymentSheet(
              //   //         paymentSheetParameters: SetupPaymentSheetParameters(
              //   //           merchantDisplayName: 'Mubarak',
              //   //           customerId: stripeCustomerId,
              //   //           setupIntentClientSecret: clientSecret,
              //   //           style: ThemeMode.light,
              //   //         ),
              //   //       );
              //   //
              //   //       Get.back();
              //   //       await Stripe.instance.presentPaymentSheet();
              //   //
              //   //       showLoader(Get.overlayContext!, "Finalizing subscription...");
              //   //       final setupIntentId = setupResponse['data']['id'];
              //   //       final priceId = selectedPlan['planDetails']['planId'];
              //   //
              //   //       log("Subscription Data: userId: , priceId: $priceId, setupIntentId: $setupIntentId");
              //   //
              //   //       final subscriptionResponse = await controller.subscriptionServices.subscription({
              //   //         "userId": userSD['id'],
              //   //         "priceId": priceId,
              //   //         "setupIntentId": setupIntentId,
              //   //       });
              //   //
              //   //       Get.back();
              //   //
              //   //       log("Subscription Response: $subscriptionResponse");
              //   //
              //   //       if (subscriptionResponse['status'] == 'success') {
              //   //         userSD['subscriptionStatus'] = 'active';
              //   //         userSD['stripeCustomerId'] = stripeCustomerId;
              //   //
              //   //         await Storage.setLogin(userSD);
              //   //
              //   //           showToast(Get.overlayContext!, msg: "Subscription created successfully", duration: 2);
              //   //         Get.offNamed(kPaymentSuccessRoute);
              //   //       } else {
              //   //         showToast(Get.overlayContext!, msg: "Failed to create subscription", duration: 2);
              //   //       }
              //   //
              //   //     } else {
              //   //       Get.back();
              //   //       showToast(Get.overlayContext!, msg: "Failed to create setup intent", duration: 2);
              //   //     }
              //   //   } catch (e) {
              //   //     // print("Error in payment: $e");
              //   //     Get.back();
              //   //     showToast(Get.overlayContext!, msg: "Payment failed. ${e.toString()}", duration: 2);
              //   //   }
              //   // },
              //
              //   padding: 0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}