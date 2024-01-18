import 'package:isar/isar.dart';

part 'note.g.dart'; // This line is needed to generate file <filename>.g.dart
// Then run: dart run build_runner build

// @collection
@Collection() // Add this line before the class
class Note {
  Id id = Isar.autoIncrement;
  late String text;
  late String dayOfWeek;
  late int exerciseOrder;
}
