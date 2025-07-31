import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';

class PdfListComponent extends StatelessWidget {
  const PdfListComponent({
    super.key,
    required this.width,
    required this.height,
    required this.pdfs,
  });

  final double width;
  final double height;
  final List<String> pdfs;

  String _getPdfName(String path) {
    return path.split('/').last.replaceAll('.pdf', '');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      itemCount: pdfs.length,
      itemBuilder: (context, index) {
        final pdfPath = pdfs[index];
        final pdfName = _getPdfName(pdfPath);

        final pdfPagesCount = 1;

        return GestureDetector(
          onTap: () {
            context.go('/pdf-detail', extra: pdfPath);
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.015),
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
      },
    );
  }
}
