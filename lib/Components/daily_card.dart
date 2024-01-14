import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  // const DayCard({super.key});

  late String dayName;

  late List<String> exerciseList;
  // List<String> exerciseList = ['chin up', 'push up'];

  DayCard({required this.dayName, required this.exerciseList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(dayName, style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: exerciseList.map((element) => Text(element)).toList()),
            ],
          )),
    );
  }
}
