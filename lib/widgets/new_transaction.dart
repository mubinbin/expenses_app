import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime? _selectedDate;

  void _dispalyDateModal() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() {
        _selectedDate = date;
      });
    });
  }

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
                  _titleController.text,
                  double.parse(_amountController.text),
                  _selectedDate),
            ),
            TextInput(
              inputController: _amountController,
              labelTitle: 'Amount',
              addNewTransaction: () => widget.addNewTransaction(
                  _titleController.text,
                  double.parse(_amountController.text),
                  _selectedDate),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Picked Date: Please pick a date'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  TextButton(
                      onPressed: _dispalyDateModal,
                      child: const Text('Choose Date')),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => widget.addNewTransaction(_titleController.text,
                  double.parse(_amountController.text), _selectedDate),
              child: Text('Add Transaction',
                  style: Theme.of(context).textTheme.headline6),
            ),
          ],
        ),
      ),
    );
  }
}
