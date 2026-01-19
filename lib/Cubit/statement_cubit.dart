import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Cubit/manager_state.dart';
import 'package:flutter_application_1/list_page/statement.dart';
import 'package:flutter_application_1/service/storage_service.dart';

class StatementCubit extends Cubit<ManagerState> {
  StatementCubit() : super(ManagerState());

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    List<Statement> savedData = await StorageService.loadStatements();
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
        : state.statements.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1;

    final newItem = Statement(
      id: newId,
      tiltle: title,
      description: desc,
      money: money,
      date: date,
    );
    final updatedList = List<Statement>.from(state.statements)..add(newItem);
    emit(state.copyWith(statements: updatedList));

    await StorageService.saveStatements(updatedList);
  }

  Future<void> deleteStatement(int id) async {
    final updatedList = state.statements
        .where((item) => item.id != id)
        .toList();
    emit(state.copyWith(statements: updatedList));
  
    await StorageService.saveStatements(updatedList);
  }
}
