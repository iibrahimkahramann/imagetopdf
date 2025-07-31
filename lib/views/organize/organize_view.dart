import 'package:flutter/material.dart';
import 'package:imagetopdf/components/organize/pdf_list_component.dart';
import 'package:imagetopdf/config/bar/custom_app_bar.dart';
import 'package:imagetopdf/widgets/organize/doc_add_button_widget.dart';

class OrganizeView extends StatefulWidget {
  const OrganizeView({super.key});

  @override
  State<OrganizeView> createState() => _OrganizeViewState();
}

class _OrganizeViewState extends State<OrganizeView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: PdfListComponent(
        width: width,
        height: height,
        pdfName: 'Test pdf',
        pdfPagesCount: 0,
      ),
      // child: EmptyDocWidget(width: width, height: height),
      floatingActionButton: DocAddButtonWdget(width: width),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
