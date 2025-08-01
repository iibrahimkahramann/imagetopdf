import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class DetailAppBarComponent extends StatelessWidget {
  const DetailAppBarComponent({
    super.key,
    required this.title,
    required this.back,
    this.icon,
    this.onIconPressed,
  });

  final String title;
  final VoidCallback back;
  final IconData? icon;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: CustomTheme.backgroundColor,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: CustomTheme.accentColor,
          size: height * 0.04,
        ),
        onPressed: () => back(),
      ),
      title: Text(title, style: CustomTheme.textTheme(context).bodyLarge),
      actions: [
        if (icon != null && onIconPressed != null)
          IconButton(
            icon: Icon(
              icon,
              color: CustomTheme.primaryColor,
              size: height * 0.03,
            ),
            onPressed: onIconPressed,
          ),
      ],
    );
  }
}
