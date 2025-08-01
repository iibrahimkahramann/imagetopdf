import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class SettingsProWidget extends StatelessWidget {
  const SettingsProWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'Free Plan',
                    style: CustomTheme.textTheme(context).bodyMedium,
                  ),
                  Text(
                    'Upgrade to unlock premium features',
                    style: CustomTheme.textTheme(context).bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
