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
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    if (title.isEmpty || amount <= 0) {
      return;
    }

    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: selectedDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });

    Navigator.of(context).pop(); //hide the modal after submitting textfield
  }

  void _deleteTransaction(String id) {
    setState(() =>
        _userTransactions.removeWhere((transaction) => transaction.id == id));
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

    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    final AppBar _appBar = AppBar(
      title: const Text('Personal Expenses'),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add, color: Colors.white),
        )
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (_mediaQuery.size.height - _appBar.preferredSize.height - _mediaQuery.padding.top) * 0.3,
              padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
              child: Card(
                child: Chart(recentTransactions: _recentTransactions),
                elevation: 6,
              ),
            ),
            SizedBox(
              height: (_mediaQuery.size.height - _appBar.preferredSize.height - _mediaQuery.padding.top) * 0.7,
              child: TransactionList(
                userTransactions: _userTransactions,
                deleteTransaction: _deleteTransaction,
              ),
            ),
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
