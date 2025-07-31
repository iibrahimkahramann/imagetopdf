import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/image_provider/image_provider.dart';

class ScanPdfComponent extends ConsumerWidget {
  const ScanPdfComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imageProvider);

    if (images.isEmpty) {
      return Container(
        width: width,
        height: height * 0.6,
        decoration: BoxDecoration(
          color: CustomTheme.verysmallcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'No images selected',
            style: CustomTheme.textTheme(context).bodyMedium,
          ),
        ),
      );
    }

    return Container(
      width: width,
      height: height * 0.6,
      decoration: BoxDecoration(
        color: CustomTheme.verysmallcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.file(images[index], fit: BoxFit.contain);
        },
      ),
    );
  }
}
