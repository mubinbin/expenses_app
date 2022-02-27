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
      title: 'Expenses App Practices',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans', // app global font style
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              fontSize: 14, fontFamily: 'Quicksand', color: Colors.grey),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple[400],
          primary: Colors.purple,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
