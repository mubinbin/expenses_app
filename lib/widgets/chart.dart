import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction>? recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double spendTotal = 0.0;

        for (int i = 0; i < recentTransactions!.length; i++) {
          if (recentTransactions![i].date.day == weekDay.day &&
              recentTransactions![i].date.month == weekDay.month &&
              recentTransactions![i].date.year == weekDay.year &&
              recentTransactions != null) {
            spendTotal += recentTransactions![i].amount;
          }
        }

        return {"day": DateFormat.E().format(weekDay), "amount": spendTotal};
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: groupedTransactions
          .map(
            (m) => Text(
                '${m['day']}: ${(m['amount'] as double) * 100.truncateToDouble() / 100}'),
          )
          .toList(),
    );
  }
}
