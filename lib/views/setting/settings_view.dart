import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/components/bar/detail_appbar_component.dart';
import 'package:imagetopdf/components/settings/settings_default_container_component.dart';
import 'package:imagetopdf/components/settings/settings_title_component.dart';
import 'package:imagetopdf/config/functions/launch_app_store.dart';
import 'package:imagetopdf/widgets/settings/settings_pro_widget.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: DetailAppBarComponent(
          title: 'Settings'.tr(),
          back: () => context.go('/organize'),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsProWidget(width: width, height: height),
            SizedBox(height: height * 0.02),
            SettingsTitleComponent(
              width: width,
              height: height,
              title: 'About'.tr(),
              icon: CupertinoIcons.info_circle,
            ),
            SizedBox(height: height * 0.015),
            SettingsDefaultContainerComponent(
              width: width,
              height: height,
              title: 'Privacy Policy'.tr(),
              icon: CupertinoIcons.shield_lefthalf_fill,
              subtitle: 'We value your privacy. Read our policy'.tr(),
              onTap: () {
                launchAppStore(
                  'https://sites.google.com/view/image-to-pdf-privacy-policy-ii/ana-sayfa',
                );
              },
            ),
            SizedBox(height: height * 0.015),
            SettingsDefaultContainerComponent(
              width: width,
              height: height,
              title: 'Terms of Use'.tr(),
              icon: CupertinoIcons.doc_text,
              subtitle: 'Understand our terms of use'.tr(),
              onTap: () {
                launchAppStore(
                  'https://sites.google.com/view/image-to-pdf-terms-of-use-ii/ana-sayfa',
                );
              },
            ),
            SizedBox(height: height * 0.015),
            SettingsTitleComponent(
              width: width,
              height: height,
              title: 'Apps Settings'.tr(),
              icon: CupertinoIcons.settings,
            ),
            SizedBox(height: height * 0.015),
            SettingsDefaultContainerComponent(
              width: width,
              height: height,
              title: 'Rate Us'.tr(),
              icon: CupertinoIcons.star,
              subtitle: 'Enjoying the app? Rate us'.tr(),
              onTap: () {
                launchAppStore(
                  'https://apps.apple.com/app/6744528945?action=write-review',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
