import 'package:flutter/material.dart';
import './user_transactions.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          SizedBox(
            child: Card(
              child: Text("PH FOR CHARTS"),
              elevation: 5,
              //color: Colors.blue,
            ),
            width: double.infinity,
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}