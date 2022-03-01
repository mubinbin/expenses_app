import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback displayDateModal;

  const SelectDate({Key? key, required this.selectedDate, required this.displayDateModal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(selectedDate == null
                ? 'Picked Date: Please pick a date'
                : 'Picked Date: ${DateFormat.yMd().format(selectedDate!)}'),
          ),
          TextButton(
              onPressed: displayDateModal, child: const Text('Choose Date')),
        ],
      ),
    );
  }
}
