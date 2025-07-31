import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetopdf/components/organize/pdf_list_component.dart';
import 'package:imagetopdf/config/bar/custom_app_bar.dart';
import 'package:imagetopdf/providers/pdf_provider/pdf_provider.dart';
import 'package:imagetopdf/widgets/organize/doc_add_button_widget.dart';
import 'package:imagetopdf/widgets/organize/empty_doc_widget.dart';

class OrganizeView extends ConsumerWidget {
  const OrganizeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final pdfs = ref.watch(pdfListProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: pdfs.isEmpty
          ? EmptyDocWidget(width: width, height: height)
          : PdfListComponent(
              width: width,
              height: height,
              pdfs: pdfs,
            ),
      floatingActionButton: DocAddButtonWdget(width: width),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
