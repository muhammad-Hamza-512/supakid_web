
import 'package:supakid_web/services/req.dart';

import 'configs.dart';

class SubscriptionServices {
  var req = Req();

//Get plans from stripe
  Future<dynamic> allPlans() async {
    return await req.get('${Configs.baseUrl}/api/getAllPlans',);
  }

  //Create Subscription
  Future<dynamic> createCheckoutSession(data) async {
    return await req.post('${Configs.baseUrl}/api/createCheckoutSession', data);
  }

//Cancel Subscription
  Future<dynamic> cancelSubscription(data) async {
    return await req.post('${Configs.baseUrl}/api/cancelSubscription', data);
  }
//Upgrade Subscription
  Future<dynamic> upgradeSubscription(data) async {
    return await req.post('${Configs.baseUrl}/api/upgradeSubscription', data);
  }
}
