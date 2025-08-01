import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class SettingsTitleComponent extends StatelessWidget {
  const SettingsTitleComponent({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.icon,
  });

  final double width;
  final double height;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.12,
          height: height * 0.05,
          decoration: BoxDecoration(
            color: CustomTheme.verysmallcolor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon),
        ),
        SizedBox(width: width * 0.04),
        Text(title, style: CustomTheme.textTheme(context).bodyMedium),
      ],
    );
  }
}
