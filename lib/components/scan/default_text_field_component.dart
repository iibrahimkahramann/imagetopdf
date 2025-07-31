import 'package:flutter/cupertino.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class DefaultTextFeldComponent extends StatelessWidget {
  const DefaultTextFeldComponent({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.07,
      child: CupertinoTextField(
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
