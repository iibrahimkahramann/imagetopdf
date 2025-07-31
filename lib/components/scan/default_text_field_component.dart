import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class DefaultTextFeldComponent extends StatelessWidget {
  const DefaultTextFeldComponent({super.key, required this.height, this.controller});

  final double height;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.07,
      child: CupertinoTextField(
        controller: controller,
        placeholder: 'Enter document name',
        style: CustomTheme.textTheme(
          context,
        ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          color: CustomTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
