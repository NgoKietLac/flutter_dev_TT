import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/manager_state.dart';
import 'package:flutter_application_1/Cubit/statement_cubit.dart';
import 'package:flutter_application_1/list_page/form_bottom_sheet.dart';
import 'package:flutter_application_1/list_page/list_widget.dart';
import 'package:flutter_application_1/list_page/statement.dart';
import 'package:flutter_application_1/service/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  StorageService service = StorageService();
  StatementCubit? _cubit;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await service.init();
    setState(() {
      _cubit = StatementCubit(service);
    });
    _cubit!.loadData();
  }

  @override
  void dispose() {
    _cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent, //transparent màu trong suốt
        elevation: 0,
        title: Text("Sao Kê Chi Tiết"),
        centerTitle: true,
      ),
      body: _cubit != null
          ? BlocBuilder<StatementCubit, ManagerState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.statements.isEmpty) {
                  return const Center(child: Text("Chưa có dữ liệu"));
                }
                return ListView.separated(
                  itemCount: state.statements.length,
                  separatorBuilder: (context, index) => SizedBox(height: 0.5),
                  itemBuilder: (context, index) {
                    final item = state.statements[index];
                    return Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext content) {
                            return AlertDialog(
                              title: Text("Xác Nhận Xoá"),
                              content: Text("Bạn có chắc muốn xoá không ?"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text("HUỶ"),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text("XOÁ"),
                                ),
                              ],
                            );
                          },
                        );
                      },

                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete_forever_rounded),
                      ),
                      onDismissed: (direction) {
                        _cubit!.deleteStatement(item.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${item.tiltle} đã bị xoá")),
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          showFormBottonSheet(
                            context,
                            initialData: item,
                            onSave: (tiltle, description, money, date) {
                              _cubit!.updateStatement(
                                item.id,
                                tiltle,
                                description,
                                money,
                                date,
                              );
                            },
                          );
                        },
                        child: ListWidget(statement: item),
                      ),
                    );
                  },
                );
              },
            )
          : SizedBox(),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showFormBottonSheet(
            context,
            onSave: (tiltle, description, money, date) {
              _cubit!.addStatement(tiltle, description, money, date);
            },
          );
        },
        child: Icon(Icons.add_circle_sharp),
      ),
    );
  }
}
