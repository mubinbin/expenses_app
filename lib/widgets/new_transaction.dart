import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addNewTransaction;

  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text.rich(
                  TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Text('Title'),
                    ),
                    WidgetSpan(
                      child: Text('*', style: TextStyle(color: Colors.red)),
                    ),
                  ]),
                ),
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                label: Text.rich(
                  TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Text('Amount'),
                    ),
                    WidgetSpan(
                      child: Text('*', style: TextStyle(color: Colors.red)),
                    ),
                  ]),
                ),
              ),
            ),
            TextButton(
              onPressed: () => addNewTransaction(titleController.text, double.parse(amountController.text)),
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
