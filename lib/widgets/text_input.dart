import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController inputController;
  final String labelTitle;

  const TextInput(
      {Key? key, required this.inputController, required this.labelTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
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
