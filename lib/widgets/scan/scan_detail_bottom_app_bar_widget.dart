import 'package:flutter/material.dart';
import 'package:imagetopdf/components/scan/scan_default_button_component.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:share_plus/share_plus.dart';

class ScanDetailBottomAppBarWidget extends StatelessWidget {
  const ScanDetailBottomAppBarWidget({
    super.key,
    required this.height,
    required this.width,
    required this.pdfPath,
  });

  final double height;
  final double width;
  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * 0.1,
      color: CustomTheme.verysmallcolor,
      child: Center(
        child: ScanDefautButtonComponent(
          width: width,
          height: height,
          onTap: () async {
            await Share.shareXFiles([
              XFile(pdfPath),
            ], text: 'Here is your PDF document!');
          },
          text: 'Share',
          icon: 'assets/icons/share.png',
        ),
      ),
    );
  }
}
