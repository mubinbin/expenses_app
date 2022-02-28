import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String barLabel;
  final double spendingAmount;
  final double spendPercentage;

  const ChartBar({
    Key? key,
    required this.barLabel,
    required this.spendingAmount,
    required this.spendPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext, constraints) =>
        Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text('\$${spendingAmount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(height: constraints.maxHeight * 0.15, child: Text(barLabel)),
          ],
        )
    );

  }
}
