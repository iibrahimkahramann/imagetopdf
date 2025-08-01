import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:pdf_render/pdf_render.dart'; // pdf_render paketi
import 'package:image/image.dart' as img; // image paketi

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

  Future<Map<String, dynamic>> _getPdfInfo(String pdfPath) async {
    final file = File(pdfPath);
    if (!await file.exists()) {
      return {'thumbnail': null, 'pageCount': 0};
    }

    final document = await PdfDocument.openFile(pdfPath);
    final pageCount = document.pageCount;

    Uint8List? thumbnailBytes;
    if (pageCount > 0) {
      final page = await document.getPage(1);
      final targetWidth = height * 0.18;
      final aspectRatio = page.width / page.height;
      final targetHeight = targetWidth / aspectRatio;

      final pdfPageImage = await page.render(
        width: targetWidth.toInt(),
        height: targetHeight.toInt(),
      );
      final image = img.Image.fromBytes(
        width: pdfPageImage.width,
        height: pdfPageImage.height,
        bytes: pdfPageImage.pixels.buffer,
        numChannels: 4,
      );
      thumbnailBytes = img.encodePng(image);
    }
    document.dispose();
    return {'thumbnail': thumbnailBytes, 'pageCount': pageCount};
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
                    FutureBuilder<Map<String, dynamic>>(
                      future: _getPdfInfo(pdfPath),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          final thumbnail = snapshot.data!['thumbnail'];
                          return Container(
                            width: width * 0.18,
                            height: height,
                            decoration: BoxDecoration(
                              color: CustomTheme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                              image: thumbnail != null
                                  ? DecorationImage(
                                      image: MemoryImage(thumbnail),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: thumbnail == null
                                ? Center(
                                    child: Icon(
                                      Icons.picture_as_pdf,
                                      color: CustomTheme.accentColor,
                                      size: width * 0.08,
                                    ),
                                  )
                                : null,
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            width: width * 0.18,
                            height: height,
                            decoration: BoxDecoration(
                              color: CustomTheme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.error,
                                color: CustomTheme.accentColor,
                                size: width * 0.08,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: width * 0.18,
                            height: height,
                            decoration: BoxDecoration(
                              color: CustomTheme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: CustomTheme.accentColor,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(width: width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pdfName,
                          style: CustomTheme.textTheme(context).bodyMedium,
                        ),
                        FutureBuilder<Map<String, dynamic>>(
                          future: _getPdfInfo(pdfPath),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              final pageCount = snapshot.data!['pageCount'];
                              return Text(
                                pageCount > 1
                                    ? tr('Pages', args: ['$pageCount'])
                                    : tr('Page', args: ['$pageCount']),
                                style: CustomTheme.textTheme(context).bodySmall,
                              );
                            } else {
                              return Text(
                                'Loading...',
                                style: CustomTheme.textTheme(context).bodySmall,
                              );
                            }
                          },
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
