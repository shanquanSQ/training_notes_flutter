class Exercise {
  late int id;
  late Map exerciseList;

  Exercise({required this.id, required this.exerciseList});

  static Exercise fromJson(json) => Exercise(
        id: json['id'],
        exerciseList: json['exerInfo'][json['id']],
      );

  @override
  String toString() {
    return 'Exercise(id: $id, exerciseList: $exerciseList)';
    // return 'Exercise(id: $id, exerciseList: $exerciseList)';
  }

  // String getDaysExercises() {
  //   return '$exerciseList';
  // }

  String formatExercise(dynamic value) {
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
      if (key == 'Exercises') {
        formattedExercises.add('\n${formatExercise(value)}');
      } else {
        formattedExercises.add('$key:\n\n${formatExercise(value)}');
      }
    });

    return formattedExercises.join("\n");
  }
}

// String getDaysExercises() {
//   List<String> formattedExercises = [];
//
//   exerciseList.forEach((key, value) {
//     formattedExercises.add('$key: ${value is List ? value.join(", ") : value}');
//   });
//
//   return formattedExercises.join("\n");
// }
