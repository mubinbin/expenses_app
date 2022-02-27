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
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                          child: Text(
                            '\$${((userTransactions[index].amount * 100).truncateToDouble() / 100)}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      // DateFormat('MMM d, y').format(userTransactions[index].date),
                      DateFormat.yMd()
                          .add_jm()
                          .format(userTransactions[index].date),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
