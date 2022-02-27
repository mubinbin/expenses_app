import 'package:flutter/material.dart';
import './text_input.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

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
              addNewTransaction: () => widget.addNewTransaction(
                  titleController.text, double.parse(amountController.text)),
            ),
            TextInput(
              inputController: amountController,
              labelTitle: 'Amount',
              addNewTransaction: () => widget.addNewTransaction(
                  titleController.text, double.parse(amountController.text)),
            ),
            TextButton(
              onPressed: () => widget.addNewTransaction(
                  titleController.text, double.parse(amountController.text)),
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
