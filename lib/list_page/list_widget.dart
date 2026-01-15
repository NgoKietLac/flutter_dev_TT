import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_page/statement.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key, required this.statement});
  final Statement statement;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 209, 209),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(children: [Text(widget.statement.id.toString())]),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(spacing: 20, children: [Text(widget.statement.tiltle)]),
              Text(widget.statement.description),
              Text(widget.statement.date),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(widget.statement.money),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
