import 'package:flutter_application_1/list_page/statement.dart';

class ManagerState {
  final List<Statement> statements;
  final bool isLoading;

  ManagerState({this.statements = const [], this.isLoading = false});

  ManagerState copyWith({List<Statement>? statements, bool? isLoading}) {
    return ManagerState(
      statements: statements ?? this.statements,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
