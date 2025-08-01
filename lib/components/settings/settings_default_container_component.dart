import 'package:flutter/cupertino.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class SettingsDefaultContainerComponent extends StatelessWidget {
  const SettingsDefaultContainerComponent({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.icon,
    required this.subtitle,
    this.onTap,
  });

  final double width;
  final double height;
  final String title;
  final IconData icon;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * 0.13,
        decoration: BoxDecoration(
          color: CustomTheme.verysmallcolor,
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
                width: width * 0.15,
                height: height * 0.065,
                decoration: BoxDecoration(
                  color: CustomTheme.accentColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: width * 0.08,
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
                      title,
                      style: CustomTheme.textTheme(
                        context,
                      ).bodyMedium!.copyWith(fontSize: width * 0.05),
                    ),
                    Text(
                      subtitle,
                      style: CustomTheme.textTheme(
                        context,
                      ).bodySmall!.copyWith(fontSize: width * 0.04),
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
