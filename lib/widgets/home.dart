import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/trasaction.dart';
import './chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "New Shoes",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Weekly Groceries",
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t3",
    //   title: "Cool Stuff",
    //   amount: 99.99999999,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

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

    Navigator.of(context).pop(); //hide the modal after submitting textfield
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: NewTransaction(addNewTransaction: _addNewTransaction),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: Card(
                child: Chart(recentTransactions: _recentTransactions),
                elevation: 6,
              ),
            ),
            TransactionList(userTransactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        splashColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
