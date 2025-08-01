import 'dart:io';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final pdfListProvider = StateNotifierProvider<PdfNotifier, List<String>>((ref) {
  return PdfNotifier();
});

class PdfNotifier extends StateNotifier<List<String>> {
  PdfNotifier() : super([]);

  static const String _pdfListKey = 'pdf_file_names';

  Future<void> loadPdfs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? pdfsJson = prefs.getString(_pdfListKey);
    if (pdfsJson != null) {
      state = List<String>.from(jsonDecode(pdfsJson));
    }
  }

  Future<void> addPdf(String absolutePath) async {
    final fileName = absolutePath.split('/').last;
    state = [...state, fileName];
    await _savePdfs();
  }

  Future<void> removePdf(String fileName) async {
    state = state.where((n) => n != fileName).toList();
    await _savePdfs();
  }

  Future<void> _savePdfs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pdfListKey, jsonEncode(state));
  }

  Future<List<String>> getAbsolutePdfPaths() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final List<String> absolutePaths = state
        .map((fileName) => '${appDocDir.path}/$fileName')
        .toList();

    absolutePaths.sort((a, b) {
      final fileA = File(a);
      final fileB = File(b);
      if (fileA.existsSync() && fileB.existsSync()) {
        return fileB.lastModifiedSync().compareTo(fileA.lastModifiedSync());
      } else if (fileA.existsSync()) {
        return -1;
      } else if (fileB.existsSync()) {
        return 1;
      } else {
        return 0;
      }
    });

    return absolutePaths;
  }
}
