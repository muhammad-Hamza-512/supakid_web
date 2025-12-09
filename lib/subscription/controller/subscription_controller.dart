import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../services/subscription_services.dart';
import '../../custom_widgets/loading.dart';


class SubscriptionController extends GetxController {

  final plans = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;
  var selectedPlan = Rx<Map<String, dynamic>?>(null);
  SubscriptionServices subscriptionServices = SubscriptionServices();

  fetchPlans() async {
    try {
      isLoading.value = true;
      final response = await subscriptionServices.allPlans();
      // print("API Response: $response");
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
        showToast(Get.context!, msg: "Failed to create checkout session");
      }
    } catch (e) {
      print("Checkout error: $e");
      showToast(Get.context!, msg: "Something went wrong.");
    } finally {
      isLoading1.value = false;
    }
  }



  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }




}
