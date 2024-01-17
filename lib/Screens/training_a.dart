import 'package:flutter/material.dart';

// Import Exercises

// Import Components
import 'package:trngprotocol_app/Components/daily_card.dart';

class TrainingA extends StatelessWidget {
  // const TrainingA({super.key});

  final List _exercises = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
          itemCount: _exercises.length,
          itemBuilder: (context, index) {
            return DayCard(
              dayName: _exercises[index],
              exerciseList: ['exercise 1', 'exercise 2'], // Will take from Database
            );
          }),
    );
  }
}
