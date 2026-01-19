import 'dart:convert';

import 'package:flutter_application_1/list_page/statement.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _key = 'du_lieu_sao_ke';
  static Future<void> saveStatements(List<Statement> list) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = list
        .map((item) => jsonEncode(item.toMap()))
        .toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<Statement>> loadStatements() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_key);

    if (jsonList == null) return [];

    return jsonList.map((item) => Statement.fromMap(jsonDecode(item))).toList();
  }
}
