import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.infor,
    required this.value,
    required this.valueColor,
  });

  final String infor;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(infor),
        Text(value, style: TextStyle(color: valueColor, fontSize: 18)),
      ],
    );
  }
}
