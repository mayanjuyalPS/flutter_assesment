import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  final String placeholder;
  final _textfieldController = TextEditingController();
  final bool isSecured;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  FormFields(
      {Key? key,
      required this.placeholder,
      this.isSecured = false,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 12),
      child: TextFormField(
        obscureText: isSecured,
        controller: _textfieldController,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(labelText: placeholder),
      ),
    );
  }
}
