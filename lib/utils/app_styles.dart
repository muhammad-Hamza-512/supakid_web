import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {

  static TextStyle interStyle(Color color,double fontSize, FontWeight fontWeight) => GoogleFonts.inter(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );

  static BorderRadius get customBorderAll4 => BorderRadius.all(
    Radius.circular(4.h),
  );

  static BorderRadius get customBorderAll8 => BorderRadius.all(
    Radius.circular(8.h),
  );

  static BorderRadius get customBorderAll6 => BorderRadius.all(
    Radius.circular(6.h),
  );
  static BorderRadius get customBorderAll => BorderRadius.all(
    Radius.circular(100.h),
  );

  static double  mainP = 15.0;
  static double p = 10.0;
  static double r = 5.0;
  static double b = 20.0;

  // Screen Dimensions
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

}