import './trasaction.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "Cool Stuff",
      amount: 99.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            child: Card(
              child: Text("PH FOR CHARTS"),
              elevation: 5,
              //color: Colors.blue,
            ),
            width: double.infinity,
          ),
          Column(
            children: transactions
                .map((t) => Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            // color: Colors.purple,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              color: Colors.purple,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              t.amount.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(t.title),
                              Text(t.date.toString()),
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
