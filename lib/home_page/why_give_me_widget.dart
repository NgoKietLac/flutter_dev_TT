import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/model_data.dart';

class WhyGiveMeWidget extends StatelessWidget {
  const WhyGiveMeWidget({super.key, required this.modelData});
  final ModelData modelData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(modelData.icon, style: TextStyle(fontSize: 40)),
          Text(
            modelData.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 133, 0, 156),
            ),
          ),
          Text(textAlign: TextAlign.center, modelData.description),
        ],
      ),
    );
  }
}
