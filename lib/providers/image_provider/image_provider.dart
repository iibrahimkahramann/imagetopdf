import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider =
    StateNotifierProvider<ImageNotifier, List<File>>((ref) {
  return ImageNotifier();
});

class ImageNotifier extends StateNotifier<List<File>> {
  ImageNotifier() : super([]);

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      final newImages = pickedFiles.map((file) => File(file.path)).toList();
      state = [...state, ...newImages];
    }
  }

  void clearImages() {
    state = [];
  }
}
