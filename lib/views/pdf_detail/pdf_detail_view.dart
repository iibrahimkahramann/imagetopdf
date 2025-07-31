import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/components/bar/detail_appbar_component.dart';
import 'package:imagetopdf/widgets/scan/scan_detail_bottom_app_bar_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfDetailView extends ConsumerStatefulWidget {
  final String pdfPath;

  const PdfDetailView({super.key, required this.pdfPath});

  @override
  ConsumerState<PdfDetailView> createState() => _PdfDetailViewState();
}

class _PdfDetailViewState extends ConsumerState<PdfDetailView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
        child: SfPdfViewer.file(File(widget.pdfPath)),
      ),
      bottomNavigationBar: ScanDetailBottomAppBarWidget(
        height: height,
        width: width,
        pdfPath: widget.pdfPath,
      ),
    );
  }
}
