// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_assesment/main.dart';

void main() {
  testWidgets('Login Test Validation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    var textfields = find.byType(TextField);
    expect(textfields, findsNWidgets(2));

    await tester.enterText(textfields.first, 'mayank@gmail.com');
    await tester.enterText(textfields.last, 'Welcome@123');

    Form form = tester.widget(find.byType(Form)) as Form;

    GlobalKey<FormState> formKey = form.key as GlobalKey<FormState>;

    expect(formKey.currentState!.validate(), isTrue);

    var button = tester.widget(find.byType(MaterialButton)) as MaterialButton;
    expect(button, findsWidgets);
    await tester.tap(find.byType(MaterialButton));
  });
}
