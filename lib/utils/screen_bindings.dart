import 'package:get/get.dart';

import '../subscription/controller/subscription_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionController());

  }
}
