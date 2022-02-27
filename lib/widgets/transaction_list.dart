import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No trasctions added yet',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
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
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${((userTransactions[index].amount * 100).truncateToDouble() / 100)}', // only display 2 decimal
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTransactions[index].title,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            // DateFormat('MMM d, y').format(t.date),
                            DateFormat.yMd()
                                .add_jm()
                                .format(userTransactions[index].date),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
