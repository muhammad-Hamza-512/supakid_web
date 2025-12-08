import 'package:get/get.dart';
import 'package:supakid_web/utils/screen_bindings.dart';

import '../subscription/all_plans_screen.dart';
import '../subscription/payment_screen.dart';
import 'app_strings.dart';
class RouteGenerator {
  static List<GetPage> getPages() {


    return [

      GetPage(name: kAllPlansRoute, page: () =>  const  AllPlansScreen(),binding: ScreenBindings()),
      GetPage(name: kPaymentSummaryRoute, page: () =>  const  PaymentSummaryScreen(), binding:ScreenBindings()),




    ];
  }
}