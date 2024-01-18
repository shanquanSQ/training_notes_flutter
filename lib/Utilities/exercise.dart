import 'dart:ui';
import 'package:flutter/material.dart';

class Exercise {
  late int id;
  late Map exerciseList;

  Exercise({required this.id, required this.exerciseList});

  static Exercise fromJson(json) => Exercise(
    id: json['id'],
    exerciseList: json['exerInfo'][json['id']],
  );

  String formatExercise(dynamic value, {TextStyle? keyStyle}) {
    if (value is List) {
      return value.join(", ");
    } else if (value is Map) {
      List<String> formattedSubExercises = [];

      value.forEach((key, subValue) {
        formattedSubExercises.add('$key: ${formatExercise(subValue)}');
      });

      return formattedSubExercises.join("\n");
    } else {
      return value.toString();
    }
  }

  String getDaysExercises() {
    List<String> formattedExercises = [];

    exerciseList.forEach((key, value) {
      TextStyle? keyStyle = getKeyStyle(key);
      if (key == 'Exercises') {
        formattedExercises.add('\n${formatExercise(value, keyStyle: keyStyle)}');
      } else {
        formattedExercises.add('$key:\n\n${formatExercise(value, keyStyle: keyStyle)}');
      }
    });

    return formattedExercises.join("\n");
  }

  TextStyle? getKeyStyle(String key) {
    // Define styles for specific keys
    if (key == 'Quadriceps') {
      return TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue, // Adjust the color as needed
      );
    } else if (key == 'Hamstrings') {
      return TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.green, // Adjust the color as needed
      );
    } else if (key == 'Calves') {
      return TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.orange, // Adjust the color as needed
      );
    }

    // Default style
    return null;
  }
}