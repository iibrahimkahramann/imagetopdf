import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class EmptyDocWidget extends StatelessWidget {
  const EmptyDocWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 0.3,
            height: height * 0.14,
            decoration: BoxDecoration(
              color: CustomTheme.secondaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset(
              'assets/icons/image-scan.png',
              width: width * 0.8,
              height: height * 0.15,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'No Documents Found'.tr(),
            style: CustomTheme.textTheme(context).bodyMedium,
          ),
          SizedBox(height: height * 0.005),
          Text(
            'Please add documents to organize them.'.tr(),
            style: CustomTheme.textTheme(
              context,
            ).bodySmall!.copyWith(color: CustomTheme.regularColor),
          ),
        ],
      ),
    );
  }
}
