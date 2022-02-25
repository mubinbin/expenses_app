import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController inputController;
  final String labelTitle;
  final Function addNewTransaction;

  const TextInput(
      {Key? key,
      required this.inputController,
      required this.labelTitle,
      required this.addNewTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      onSubmitted: (_) => addNewTransaction(),
      keyboardType:
          labelTitle == 'Amount' ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text.rich(
          TextSpan(children: <InlineSpan>[
            WidgetSpan(
              child: Text(labelTitle),
            ),
            const WidgetSpan(
              child: Text('*', style: TextStyle(color: Colors.red)),
            ),
          ]),
        ),
      ),
    );
  }
}
