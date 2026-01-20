import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Cubit/manager_state.dart';
import 'package:flutter_application_1/list_page/statement.dart';

import '../service/service.dart';

class StatementCubit extends Cubit<ManagerState> {
  StatementCubit(this.service) : super(ManagerState());

  final Service service;

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    List<Statement> savedData = await service.loadStatements();
    emit(state.copyWith(statements: savedData, isLoading: false));
  }

  Future<void> addStatement(
    String title,
    String desc,
    String money,
    String date,
  ) async {
    int newId = state.statements.isEmpty
        ? 0
        : state.statements
                  .map((Statement item) => item.id)
                  .reduce((a, b) => a > b ? a : b) +
              1;

    final newItem = Statement(
      id: newId,
      tiltle: title,
      description: desc,
      money: money,
      date: date,
    );
    final updatedList = List<Statement>.from(state.statements)..add(newItem);
    emit(state.copyWith(statements: updatedList));

    await service.saveStatements(updatedList);
  }

  Future<void> deleteStatement(int id) async {
    await service.deleteStatement(id);
    loadData();
  }

  Future<void> updateStatement(
    int id,
    String title,
    String desc,
    String money,
    String date,
  ) async {
    final updatedItem = Statement(
      id: id,
      tiltle: title,
      description: desc,
      money: money,
      date: date,
    );
    await service.updateStatement(updatedItem);
    final newList = await service.loadStatements();
    emit(state.copyWith(statements: newList));
  }
}
