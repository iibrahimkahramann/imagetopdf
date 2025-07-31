import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class ScanPdfComponent extends StatelessWidget {
  const ScanPdfComponent({
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
      height: height * 0.6,
      decoration: BoxDecoration(
        color: CustomTheme.verysmallcolor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
