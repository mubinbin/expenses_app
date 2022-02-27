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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

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
              inputController: _titleController,
              labelTitle: 'Title',
              addNewTransaction: () => widget.addNewTransaction(
                  _titleController.text, double.parse(_amountController.text)),
            ),
            TextInput(
              inputController: _amountController,
              labelTitle: 'Amount',
              addNewTransaction: () => widget.addNewTransaction(
                  _titleController.text, double.parse(_amountController.text)),
            ),
            TextButton(
              onPressed: () => widget.addNewTransaction(
                  _titleController.text, double.parse(_amountController.text)),
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
