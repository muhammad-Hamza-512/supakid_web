import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../services/subscription_services.dart';


class SubscriptionController extends GetxController {

  final plans = <Map<String, dynamic>>[].obs;
  final isLoading = RxBool(false);
  var selectedPlan = Rx<Map<String, dynamic>?>(null);
  SubscriptionServices subscriptionServices = SubscriptionServices();

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

  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }




}
