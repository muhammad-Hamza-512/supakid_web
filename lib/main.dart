import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supakid_web/utils/app_colors.dart';
import 'package:supakid_web/utils/app_strings.dart';
import 'package:supakid_web/utils/app_styles.dart';
import 'package:supakid_web/utils/route_generator.dart';
import 'package:supakid_web/utils/screen_bindings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kPrimaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kWhiteColor,),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: kWhiteColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // hintStyle: AppStyles.figTextStyle(kHintTextColor, 16, FontWeight.w400),
        // prefixIconColor: kIconColor,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: AppStyles.mainP,
        ),
        // fillColor: kFieldColor,
        filled: true,
        // iconColor: kBlackColor,
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: kPrimaryColor),
          borderRadius: AppStyles.customBorderAll8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppStyles.customBorderAll8,
          borderSide:  const BorderSide(color: kPrimaryColor),
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: kWhiteColor, fontSize: 14.sp) ,
        bodyLarge: TextStyle(color: kWhiteColor, fontSize: 14.sp),
        bodyMedium: TextStyle(color: kWhiteColor, fontSize: 14.sp),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            theme: _buildTheme(Brightness.light),
            title: "SupaKid",
            debugShowCheckedModeBanner: false,
            initialBinding: ScreenBindings(),
            initialRoute: kAllPlansRoute,
            getPages: RouteGenerator.getPages(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(1.0, 1.0))),
                  child: child!);
            });
      },
    );
  }
}
