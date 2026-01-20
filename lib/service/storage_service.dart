import 'dart:convert';

import 'package:flutter_application_1/list_page/statement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service.dart';

class StorageService implements Service {
  static const String _key = 'du_lieu_sao_ke';
  SharedPreferences? prefs;
  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveStatements(List<Statement> list) async {
    List<String> jsonList = list
        .map((Statement item) => jsonEncode(item.toMap()))
        .toList();
    await prefs!.setStringList(_key, jsonList);
  }

  @override
  Future<List<Statement>> loadStatements() async {
    List<String>? jsonList = prefs!.getStringList(_key);

    if (jsonList == null) return [];

    return jsonList.map((item) => Statement.fromMap(jsonDecode(item))).toList();
  }

  @override
  Future<void> deleteStatement(int id) async {
    final prefs = await loadStatements();
    prefs.removeWhere((Statement item) => item.id == id);
    saveStatements(prefs);
  }

  @override
  Future<void> updateStatement(Statement updatedItem) async {
    final prefs = await loadStatements();
    int index = prefs.indexWhere((Statement item) => item.id == updatedItem.id);
    if (index != -1) {
      prefs[index] = updatedItem;
    }
    saveStatements(prefs);
  }
}
