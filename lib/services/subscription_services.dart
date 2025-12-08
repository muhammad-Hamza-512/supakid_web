
import 'package:supakid_web/services/req.dart';

import 'configs.dart';

class SubscriptionServices {
  var req = Req();

//Get plans from stripe
  Future<dynamic> allPlans() async {
    return await req.get('${Configs.baseUrl}/api/getAllPlans',);
  }
//Create setup intent
  Future<dynamic> createIntent(data) async {
    return await req.post('${Configs.baseUrl}/api/createCustomerAndSetupIntent', data);
  }
//Create subscription
  Future<dynamic> subscription(data) async {
    return await req.post('${Configs.baseUrl}/api/createSubscription',data);
  }

// //Get Current subscription
//   Future<dynamic> currentSubscription(data) async {
//     return await req.getReq('${Configs.baseUrl}/api/getCurrentSubscription', data);
//   }
// //Get billing history
//   Future<dynamic> billingHistory(data) async {
//     return await req.getReq('${Configs.baseUrl}/api/getBillingHistory', data);
//   }
//Cancel Subscription
  Future<dynamic> cancelSubscription(data) async {
    return await req.post('${Configs.baseUrl}/api/cancelSubscription', data);
  }
//Upgrade Subscription
  Future<dynamic> upgradeSubscription(data) async {
    return await req.post('${Configs.baseUrl}/api/upgradeSubscription', data);
  }
}
