import 'package:flutter/material.dart';
import 'package:trngprotocol_app/Screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        appBarTheme: const AppBarTheme(),
        useMaterial3: true,
      )));
}
