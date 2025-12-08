import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

FToast fToast = FToast();

showToast(BuildContext context, {int duration = 3, String msg = ''}) {

  fToast.init(context);
  fToast.showToast(
    toastDuration: Duration(seconds: duration),
    gravity: ToastGravity.BOTTOM,
    child: Container(
      padding: const EdgeInsets.only(left: 13, top: 20, right: 5, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
        kWhiteColor, boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(2, 3),
        ),
      ],
      ),
      child: Row(
        children: [
          // Image.asset('assets/images/t_logo.png', height: 15),
          // const SizedBox(width: 13),
          Expanded(
            child: Text(
              msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

showLoader(BuildContext dialogContext, message) {
  AlertDialog alert = AlertDialog(
    backgroundColor: kCardColor,
    shadowColor: kBlackColor.withValues(alpha: 0.2),
    content: Row(
      children: [
        const Padding(
          padding:  EdgeInsets.all(1),
          child: CircularProgressIndicator(
            backgroundColor: kWhiteColor,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                message,
                maxLines: 5,
                style: const TextStyle(fontSize: 16, color: kPrimaryColor ),
              ),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: dialogContext,
    builder: (BuildContext dialogContext) {
      return alert;
    },
  );
}
void showCustomDialog({
  required String title,
  required String middleText,
  required VoidCallback onConfirm,
}) {
  Get.defaultDialog(
    backgroundColor: kWhiteColor,
    title: title,
    titlePadding: EdgeInsets.only(top: 20.h),
    titleStyle: AppStyles.interStyle(kBlackColor, 18, FontWeight.w800),
    middleText: middleText,
    middleTextStyle: AppStyles.interStyle(kBlackColor, 12, FontWeight.w400),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: AppStyles.interStyle(kBlackColor, 14, FontWeight.w500)),
          ),
          TextButton(
            onPressed: () {
              onConfirm();
              Get.back();
            },
            style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
            child: Text("Ok", style: AppStyles.interStyle(kWhiteColor, 14, FontWeight.w800)),
          ),
        ],
      ),
    ],
  );
}

