import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class ScanDefautButtonComponent extends StatelessWidget {
  const ScanDefautButtonComponent({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final double width;
  final double height;
  final VoidCallback onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.434,
        height: height * 0.065,
        decoration: BoxDecoration(
          color: CustomTheme.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomTheme.primaryColor, width: 1),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: width * 0.06,
                height: height * 0.06,

                color: CustomTheme.primaryColor,
              ),
              SizedBox(width: width * 0.02),
              Text(
                text,
                style: CustomTheme.textTheme(
                  context,
                ).bodyMedium?.copyWith(color: CustomTheme.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
