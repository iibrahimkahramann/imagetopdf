import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final pdfListProvider = StateNotifierProvider<PdfNotifier, List<String>>((ref) {
  return PdfNotifier();
});

class PdfNotifier extends StateNotifier<List<String>> {
  PdfNotifier() : super([]);

  static const String _pdfListKey = 'pdf_file_paths';

  Future<void> loadPdfs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? pdfsJson = prefs.getString(_pdfListKey);
    if (pdfsJson != null) {
      state = List<String>.from(jsonDecode(pdfsJson));
    }
  }

  Future<void> addPdf(String path) async {
    state = [...state, path];
    await _savePdfs();
  }

  Future<void> removePdf(String path) async {
    state = state.where((p) => p != path).toList();
    await _savePdfs();
  }

  Future<void> _savePdfs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pdfListKey, jsonEncode(state));
  }
}
