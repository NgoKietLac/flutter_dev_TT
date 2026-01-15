import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_page/form_bottom_sheet.dart';
import 'package:flutter_application_1/list_page/list_widget.dart';
import 'package:flutter_application_1/list_page/statement.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Statement> statementList = [];
  int id = 0;

  void addStatement(
    String tiltle,
    String description,
    String money,
    String date,
    bool isChecked,
  ) {
    setState(() {
      statementList.add(
        Statement(
          id: id++,
          tiltle: tiltle,
          description: description,
          money: money,
          date: date,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sao Kê"),
      ),
      body: statementList.isEmpty
          ? Center(child: Text("Chưa có dữ liệu"))
          : ListView.separated(
              itemCount: statementList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 0.5);
              },
              itemBuilder: (context, index) {
                final item = statementList[index];
                return ListWidget(
                  statement: Statement(
                    id: item.id,
                    tiltle: item.tiltle,
                    description: item.description,
                    money: item.money,
                    date: item.date,
                  ),
                );
              },
            ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showFormBottonSheet(
            context,
            onSave: (tiltle, description, money, date) {
              addStatement(tiltle, description, money, date, false);
            },
          );
        },
        child: Icon(Icons.add_circle_sharp),
      ),
    );
  }
}
