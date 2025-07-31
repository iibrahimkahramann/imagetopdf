import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/components/bar/detail_appbar_component.dart';
import 'package:imagetopdf/components/scan/scan_pdf_component.dart';

import 'package:imagetopdf/widgets/scan/bottom_app_bar_widget.dart';

class ScanDocumentView extends ConsumerStatefulWidget {
  const ScanDocumentView({super.key});

  @override
  ConsumerState<ScanDocumentView> createState() => _ScanDocumentViewState();
}

class _ScanDocumentViewState extends ConsumerState<ScanDocumentView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: DetailAppBarComponent(
          title: 'Scan Document',
          back: () => context.go('/organize'),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: ScanPdfComponent(width: width, height: height),
      ),
      bottomNavigationBar: BottomAppBarWidget(height: height, width: width),
    );
  }
}
