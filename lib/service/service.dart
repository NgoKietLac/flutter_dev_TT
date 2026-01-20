import 'package:flutter_application_1/list_page/statement.dart';

abstract class Service {
  Future<void> saveStatements(List<Statement> list);
  Future<List<Statement>> loadStatements();
  Future<void> deleteStatement(int id);
  Future<void> updateStatement(Statement updatedItem);
}
