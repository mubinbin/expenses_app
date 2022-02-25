import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'widgets/home.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Practices',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple[400],
          primary: Colors.purple,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
