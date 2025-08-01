import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/functions/rc_paywall.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/premium/premium_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsProWidget extends ConsumerWidget {
  const SettingsProWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(isPremiumProvider);
    return GestureDetector(
      onTap: () async {
        if (!isPremium) {
          await RevenueCatService.showPaywall();
        }
      },
      child: Container(
        width: width,
        height: height * 0.15,
        decoration: BoxDecoration(
          color: CustomTheme.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.02,
          ),
          child: Row(
            children: [
              Container(
                width: width * 0.23,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: CustomTheme.accentColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.stars,
                  size: width * 0.13,
                  color: CustomTheme.boldColor,
                ),
              ),
              SizedBox(width: width * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isPremium ? 'Premium Plan'.tr() : 'Free Plan'.tr(),
                      style: CustomTheme.textTheme(
                        context,
                      ).titleMedium?.copyWith(color: CustomTheme.boldColor),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      isPremium
                          ? 'Enjoy premium features and support development'
                                .tr()
                          : 'Upgrade to unlock premium features'.tr(),
                      style: CustomTheme.textTheme(context).bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
