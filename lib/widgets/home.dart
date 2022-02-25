import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/trasaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    if (title.isEmpty || amount <= 0) {
      return;
    }

    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });

    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return NewTransaction(addNewTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              child: Card(
                child: Text("PH FOR CHARTS"),
                elevation: 5,
              ),
              width: double.infinity,
            ),
            TransactionList(userTransactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        splashColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
