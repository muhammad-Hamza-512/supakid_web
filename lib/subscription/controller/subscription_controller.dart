import 'dart:developer';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../services/subscription_services.dart';
import '../../custom_widgets/loading.dart';
import '../../services/storage.dart';


class SubscriptionController extends GetxController {

  final plans = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;
  var selectedPlan = Rx<Map<String, dynamic>?>(null);
  SubscriptionServices subscriptionServices = SubscriptionServices();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await fetchPlans();
    await restoreSelectedPlan();
    saveTokenFromUrlIfExists();
  }

  fetchPlans() async {
    try {
      isLoading.value = true;
      final response = await subscriptionServices.allPlans();
      print("API Response: $response");
      if (response != null && response['plans'] != null) {
        final plansData = response['plans'];
        List<Map<String, dynamic>> plansList = [];
        plansData.forEach((key, value) {
          plansList.add({
            'planName': key,
            'planDetails': value,
          });
        });

        plans.value = plansList;
      } else {
        // print('Plans not found in response: $response');
      }
    } catch (e) {
      // print('Error fetching plans: $e');
    } finally {
      isLoading.value = false;
    }
  }

  //  saveTokenFromUrlIfExists() async {
  //    log("FUnction is going on--------");
  //
  //   final uri = Uri.base;
  //   final token = uri.queryParameters['token'];
  //   //  final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE3LCJpYXQiOjE3NjU4OTAwODIsImV4cCI6MTc2NTg5MTg4Mn0.4jamJtQBF4XwSZrSVxWwjH5I3lYxAR92JpLp6LwIOK0";
  //
  //   if (token != null && token.isNotEmpty) {
  //     await Storage.setToken(token);
  //     log("Web token saved: $token");
  //   } else {
  //     log("No token found in URL.");
  //   }
  // }

  saveTokenFromUrlIfExists() async {
    log("Function is running --------");

    final uri = Uri.base;

    final fragment = uri.fragment;

    if (fragment.contains('?')) {
      final queryString = fragment.split('?').last;
      final params = Uri.splitQueryString(queryString);

      final token = params['token'];

      if (token != null && token.isNotEmpty) {
        await Storage.setToken(token);
        log("✅ Web token saved from URL fragment: $token");
        return;
      }
    }

    log("❌ No token found in URL fragment.");
  }


  startCheckout(String priceId) async {
    isLoading1.value = true;
    try {
      var data = {
        "priceId": priceId,
      };

      var response = await subscriptionServices.createCheckoutSession(data);
      print("Checkout session response: $response");

      if (response['status'] == 'success') {
        final sessionUrl = response['url'];

        if (await canLaunchUrl(Uri.parse(sessionUrl))) {
          await launchUrl(
            Uri.parse(sessionUrl),
            mode: LaunchMode.externalApplication,
          );
        } else {
          throw "Could not launch Stripe checkout URL";
        }
      } else {
        showToast(Get.overlayContext!, msg: "Failed to create checkout session");
      }
    } catch (e) {
      print("Checkout error: $e");
      showToast(Get.overlayContext!, msg: "Something went wrong.");
    } finally {
      isLoading1.value = false;
    }
  }
  Future<void> restoreSelectedPlan() async {
    if (selectedPlan.value != null) return;

    final storedPlan = await Storage.getSelectedPlan();
    if (storedPlan != null) {
      selectedPlan.value = storedPlan;
      log("Selected plan restored from storage");
    }
  }





// @override
  // void onInit() {
  //   fetchPlans();
  //   restoreSelectedPlan();
  //   saveTokenFromUrlIfExists();
  //   super.onInit();
  // }




}
