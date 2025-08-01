import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetopdf/components/scan/default_text_field_component.dart';
import 'package:imagetopdf/components/scan/scan_default_button_component.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/image_provider/image_provider.dart';
import 'package:imagetopdf/providers/pdf_provider/pdf_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';

class BottomAppBarWidget extends ConsumerStatefulWidget {
  const BottomAppBarWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  ConsumerState<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends ConsumerState<BottomAppBarWidget> {
  final TextEditingController _documentNameController = TextEditingController();

  Future<void> _createAndSavePdf(List<File> images) async {
    final pdf = pw.Document();

    for (var imageFile in images) {
      final image = pw.MemoryImage(imageFile.readAsBytesSync());
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(image));
          },
        ),
      );
    }

    final appDocDir = await getApplicationDocumentsDirectory();
    final fileName = _documentNameController.text.isEmpty
        ? 'document'
        : _documentNameController.text;
    final outputFile = File('${appDocDir.path}/$fileName.pdf');
    await outputFile.writeAsBytes(await pdf.save());

    ref.read(pdfListProvider.notifier).addPdf(outputFile.path);
    ref.read(imageProvider.notifier).clearImages();

    if (mounted) {
      context.go('/organize');
    }
  }

  @override
  void dispose() {
    _documentNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = ref.watch(imageProvider);

    return BottomAppBar(
      height: widget.height * 0.185,
      color: CustomTheme.verysmallcolor,
      child: Column(
        children: [
          DefaultTextFeldComponent(
            height: widget.height,
            controller: _documentNameController,
          ),
          SizedBox(height: widget.height * 0.02),
          Center(
            child: ScanDefautButtonComponent(
              width: widget.width,
              height: widget.height,
              onTap: () async {
                if (images.isNotEmpty) {
                  if (_documentNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a document name.'),
                      ),
                    );
                    return;
                  }
                  await _createAndSavePdf(images);
                }
              },
              text: 'Save',
              icon: 'assets/icons/save.png',
            ),
          ),
        ],
      ),
    );
  }
}
