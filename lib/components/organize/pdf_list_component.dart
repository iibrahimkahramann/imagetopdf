import 'package:flutter/material.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class PdfListComponent extends StatelessWidget {
  const PdfListComponent({
    super.key,
    required this.width,
    required this.height,
    required this.pdfName,
    required this.pdfPagesCount,
  });

  final double width;
  final double height;
  final String pdfName;
  final int pdfPagesCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Container(
          width: width,
          height: height * 0.1,
          decoration: BoxDecoration(
            color: CustomTheme.verysmallcolor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.013,
            ),
            child: Row(
              children: [
                Container(
                  width: width * 0.18,
                  height: height,
                  decoration: BoxDecoration(
                    color: CustomTheme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pdfName,
                      style: CustomTheme.textTheme(context).bodyMedium,
                    ),
                    Text(
                      pdfPagesCount > 1 ? '$pdfPagesCount Pages' : '1 Page',
                      style: CustomTheme.textTheme(context).bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
