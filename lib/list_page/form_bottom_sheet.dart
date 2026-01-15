import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showFormBottonSheet(
  BuildContext context, {
  required Function(
    String tiltle,
    String description,
    String money,
    String date,
  )
  onSave,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return FormBottomSheet(onSave: onSave);
    },
  );
}

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({super.key, required this.onSave});

  final Function(String title, String description, String money, String date)
  onSave;

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moneyController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          20 + MediaQuery.of(context).viewInsets.bottom,
        ),
        color: const Color.fromARGB(255, 255, 255, 253),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Tiêu Đề: "),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "mời bạn nhập thông tin Tiêu Đề";
                  }
                  return null;
                },
                controller: titleController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Mô tả: "),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "mời bạn nhập thông tin mô tả";
                  }
                  return null;
                },
                controller: descriptionController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Tiền"),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "mời bạn nhập thông tin tiền";
                  }
                  return null;
                },
                controller: moneyController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Ngày Thực hiện: "),
              TextFormField(
                readOnly: true,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  print('Date: $selectedDate');

                  if (selectedDate != null) {
                    setState(() {
                      dateController.text =
                          selectedDate.day.toString() +
                          "/" +
                          selectedDate.month.toString() +
                          "/" +
                          selectedDate.year.toString();
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "mời bạn nhập thông tin Ngày";
                  }
                  return null;
                },
                controller: dateController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.onSave(
                      titleController.text,
                      descriptionController.text,
                      moneyController.text,
                      dateController.text,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Thêm Sao Kê Thành Công')),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Save")],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    moneyController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
