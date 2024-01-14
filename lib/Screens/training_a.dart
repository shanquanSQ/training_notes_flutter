import 'package:flutter/material.dart';

// Import Exercises

// Import Components
import 'package:trngprotocol_app/Components/daily_card.dart';

class TrainingA extends StatelessWidget {
  // const TrainingA({super.key});

  final List _exercises = ['Monday', 'Tuesday', 'Wednesday', 'Thursday'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _exercises.length,
          itemBuilder: (context, index) {
            return DayCard(
              dayName: _exercises[index],
              exerciseList: ['exercise 1', 'exercise 2'],
            );
          }),
    );
  }
}
