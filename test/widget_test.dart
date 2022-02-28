// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expenses_app/main.dart';

void main() {
  testWidgets('home page is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const ExpensesApp());

    expect(find.text('Personal Expenses'), findsOneWidget);
    expect(find.text('My App'), findsNothing);

    expect(find.byIcon(Icons.add), findsNWidgets(2));
  });
}
