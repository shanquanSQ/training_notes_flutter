import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider dependency

// Import Screens
import 'package:trngprotocol_app/Screens/home_screen.dart';

// Import Db
import 'package:trngprotocol_app/models/note_database.dart';

//Import Libraries
// import 'package:path_provider/path_provider.dart'; // State management

void main() async {
  // Initialise Note Isar Database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize(); // Run the initialisation function we created

  runApp(ChangeNotifierProvider( // Install Provider as dependency first
    create: (context) => NoteDatabase(),
    child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          appBarTheme: const AppBarTheme(),
          useMaterial3: true,
        )),
  ));
}
