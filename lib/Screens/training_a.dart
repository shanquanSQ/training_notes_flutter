import 'package:flutter/material.dart';
import 'dart:convert'; // to decode JSONs

// Import Components
import 'package:trngprotocol_app/Components/daily_card.dart';
import 'package:trngprotocol_app/Utilities/exercise.dart';

// Import Exercises

class TrainingA extends StatelessWidget {
  // const TrainingA({super.key});
  late List<Exercise> exerciseList = getAllExercises();

  static getAllExercises() {
    const data = [
      {
        "id": 1,
        "exerInfo": {
          1: {
            "Exercises": ["Jogging", "Rowing", "Cycling", "Swimming", "Hiking"],
          }
        }
      },
      {
        "id": 2,
        "exerInfo": {
          2: {
            "Exercises": ["Jogging", "Rowing", "Cycling", "Swimming", "Hiking"],
          }
        }
      },
      {
        "id": 3,
        "exerInfo": {
          3: {
            "Exercises": {
              "Quadriceps": ["Leg Extension", "Hack Squats"],
              "Hamstrings": ["Leg Curls", "Glute-Ham-Raises"],
              "Calves": ["Standing Raises", "Seated Raises"]
            },
          }
        }
      },
      {
        "id": 4,
        "exerInfo": {
          4: {
            "Exercises": ["Heat Exposure Protocol", "Cold Exposure Protocol"],
          }
        }
      },
      {
        "id": 5,
        "exerInfo": {
          5: {
            "Exercises": {
              "Chest": ["Incline Press", "Cable Crossover"],
              "Back": ["Chin-Up or Pull-Up", "Seated Row or Dumbbell Row"],
              "Shoulders": ["Shoulder Press", "Lateral Raises", "Rear Deltoid Flies"],
              "Neck": ["Neck Exercises"],
              "Cardio":
              "Running, rowing, cycling, jumping jacks, stair-climb, jump rope — ideally done outside.",
            }
          }
        }
      },
      {
        "id": 6,
        "exerInfo": {
          6: {
            "Exercises": [
              "Assault Bike",
              "Sprint/Jog Intervals",
              "Rowing",
              "Skiing Machine",
              "Sand Sprints"
            ],
          }
        }
      },
      {
        "id": 7,
        "exerInfo": {
          7: {
            "Exercises": {
              "Biceps": ["Incline Curl", "Dumbbell Curls"],
              "Triceps": ["Overhead Extensions", "Triceps Dips or Regular Dips"],
              "Calves": ["Standing Calf Raise", "Seated Calf Raise", "Tibialis Raises"],
              "Neck": ["Neck Exercises"],
            }
          }
        }
      }
    ];
    return data.map<Exercise>(Exercise.fromJson).toList();
  }

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
    print('printing');
    print(exerciseList[1].getDaysExercises());

    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
          itemCount: _exercises.length,
          itemBuilder: (context, index) {
            return DayCard(
              dayName: _exercises[index],
              // exerciseList: ['exercise 1', 'exercise 2'], // Will take from Database
              exerciseList: [exerciseList[index].getDaysExercises()], // Will take from Database
            );
          }),
    );
  }
}
