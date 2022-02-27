import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import '../models/trasaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double spendTotal = 0.0;

        for (int i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            spendTotal += recentTransactions[i].amount;
          }
        }

        return {"day": DateFormat.E().format(weekDay), "amount": spendTotal};
      });

  double get spendingTotal {
    return groupedTransactions.fold(
        0.0, (prev, cur) => prev + (cur['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions
            .map(
              (m) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  barLabel: m['day'].toString(),
                  spendingAmount:
                      (m['amount'] as double) * 100.truncateToDouble() / 100,
                  spendPercentage: spendingTotal == 0.0
                      ? 0.0
                      : (m['amount'] as double) / spendingTotal,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
