import 'package:flutter/material.dart';
import 'package:imagetopdf/components/scan/default_text_field_component.dart';
import 'package:imagetopdf/components/scan/scan_default_button_component.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * 0.185,
      color: CustomTheme.verysmallcolor,
      child: Column(
        children: [
          DefaultTextFeldComponent(height: height),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScanDefautButtonComponent(
                width: width,
                height: height,
                onTap: () {},
                text: 'Share',
                icon: 'assets/icons/share.png',
              ),
              ScanDefautButtonComponent(
                width: width,
                height: height,
                onTap: () {},
                text: 'Save',
                icon: 'assets/icons/save.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
