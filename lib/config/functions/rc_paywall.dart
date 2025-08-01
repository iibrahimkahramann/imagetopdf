import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class RevenueCatService {
  static Future<bool> isUserPremium() async {
    final customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.all['premium']?.isActive ?? false;
  }

  static Future<void> showPaywall() async {
    final result = await RevenueCatUI.presentPaywallIfNeeded("premium");
    print("Paywall result: $result");
  }
}
