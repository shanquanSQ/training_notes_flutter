import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trngprotocol_app/models/note_database.dart';

class DayCard extends StatefulWidget {
  // const DayCard({super.key});

  late String dayName;
  late List<dynamic> exerciseList;

  // List<String> exerciseList = ['chin up', 'push up'];

  DayCard({required this.dayName, required this.exerciseList});

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(); // Controller to access what user typed

    // CRUD Functions
    void createNote() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text('Input New Exercise:'),
                    TextField(
                      controller: textController,
                      // maxLines: 5,
                      decoration: InputDecoration(),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Create Note Functionality
                      context.read<NoteDatabase>().addNote(textController.text, widget.dayName, 1);

                      // Remove text from next dialog + remove modal dialog
                      textController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Create',
                      // style: TextStyle(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  )
                ],
              ));
    }

    // Read Database - Get all entries for the dayOfWeek , and sort by exerciseOrder
    void getAllExercise(){

    }

    return Card(
      color: Colors.blueGrey.shade100,
      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(widget.dayName, style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.exerciseList.map((element) => Text(element)).toList()
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: createNote,
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.black87,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
