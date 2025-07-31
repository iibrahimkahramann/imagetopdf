import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class DetailAppBarComponent extends StatelessWidget {
  const DetailAppBarComponent({
    super.key,
    required this.title,
    required this.back,
  });

  final String title;
  final VoidCallback back;

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
    );
  }
}
