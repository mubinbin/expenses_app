import 'package:flutter/material.dart';
import './text_input.dart';

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
            TextInput(
              inputController: titleController,
              labelTitle: 'Title',
            ),
            TextInput(
              inputController: amountController,
              labelTitle: 'Amount',
            ),
            TextButton(
              onPressed: () => addNewTransaction(
                  titleController.text, double.parse(amountController.text)),
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
