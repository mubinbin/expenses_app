import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

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
      amount: 99.99999999,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            child: Card(
              child: Text("PH FOR CHARTS"),
              elevation: 5,
              //color: Colors.blue,
            ),
            width: double.infinity,
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      label: Text.rich(
                        TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                            child: Text('Title'),
                          ),
                          WidgetSpan(
                            child:
                                Text('*', style: TextStyle(color: Colors.red)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text.rich(
                        TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                            child: Text('Amount'),
                          ),
                          WidgetSpan(
                            child:
                                Text('*', style: TextStyle(color: Colors.red)),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => print("hello"),
                    child: const Text(
                      'Add Transaction',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
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
                              '\$${((t.amount * 100).truncateToDouble() / 100)}', // only display 2 decimal
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                t.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // DateFormat('MMM d, y').format(t.date),
                                DateFormat.yMd().add_jm().format(t.date),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
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
