import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/components/bar/detail_appbar_component.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/loading_provider/loading_provider.dart';
import 'package:imagetopdf/widgets/scan/scan_detail_bottom_app_bar_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfDetailView extends ConsumerWidget {
  final String pdfPath;

  const PdfDetailView({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final file = File(pdfPath);
    final isLoading = ref.watch(pdfLoadingProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: DetailAppBarComponent(
          title: 'PDF Viewer',
          back: () => context.go('/organize'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: FutureBuilder<bool>(
          future: file.exists(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data == true) {
                return Stack(
                  children: [
                    SfPdfViewer.file(
                      file,
                      onDocumentLoaded: (details) {
                        ref.read(pdfLoadingProvider.notifier).state = false;
                      },
                    ),
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: CustomTheme.primaryColor,
                        ),
                      ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'PDF file not found or corrupted.',
                    style: CustomTheme.textTheme(context).bodyMedium,
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: ScanDetailBottomAppBarWidget(
        height: height,
        width: width,
        pdfPath: pdfPath,
      ),
    );
  }
}
