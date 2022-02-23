import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  
  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions
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
    );
  }
}
