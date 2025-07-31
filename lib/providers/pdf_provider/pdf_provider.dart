import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final pdfListProvider = StateNotifierProvider<PdfNotifier, List<String>>((ref) {
  return PdfNotifier();
});

class PdfNotifier extends StateNotifier<List<String>> {
  PdfNotifier() : super([]);

  static const String _pdfListKey = 'pdf_file_names'; // Anahtar adını değiştirdim

  Future<void> loadPdfs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? pdfsJson = prefs.getString(_pdfListKey);
    if (pdfsJson != null) {
      state = List<String>.from(jsonDecode(pdfsJson));
    }
  }

  Future<void> addPdf(String absolutePath) async {
    final fileName = absolutePath.split('/').last; // Sadece dosya adını al
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
    return state.map((fileName) => '${appDocDir.path}/$fileName').toList();
  }
}
