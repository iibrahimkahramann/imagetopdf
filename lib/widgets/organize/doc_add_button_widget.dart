import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imagetopdf/config/theme/custom_theme.dart';
import 'package:imagetopdf/providers/image_provider/image_provider.dart';

class DocAddButtonWdget extends ConsumerWidget {
  const DocAddButtonWdget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        await ref.read(imageProvider.notifier).pickImages();
        if (ref.read(imageProvider).isNotEmpty) {
          context.go('/doc-scan');
        }
      },
      backgroundColor: CustomTheme.primaryColor,
      child: Icon(
        CupertinoIcons.add,
        size: width * 0.08,
        color: CustomTheme.accentColor,
      ),
    );
  }
}
