import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class DocAddButtonWdget extends StatelessWidget {
  const DocAddButtonWdget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.go('/doc-scan'),
      backgroundColor: CustomTheme.primaryColor,
      child: Icon(
        CupertinoIcons.add,
        size: width * 0.08,
        color: CustomTheme.accentColor,
      ),
    );
  }
}
