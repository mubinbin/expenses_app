import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction>? recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTranscations =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double spandTotal = 0.0;

        for (int i = 0; i < recentTransactions!.length; i++) {
          if (recentTransactions![i].date.day == weekDay.day &&
              recentTransactions![i].date.month == weekDay.month &&
              recentTransactions![i].date.year == weekDay.year &&
              recentTransactions != null) {
            spandTotal += recentTransactions![i].amount;
          }
        }

        return {"day": DateFormat.E().format(weekDay), "amount": spandTotal};
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: groupedTranscations
          .map(
            (m) => Text(
                '${m['day']}: ${(m['amount'] as double) * 100.truncateToDouble() / 100}'),
          )
          .toList(),
    );
  }
}
