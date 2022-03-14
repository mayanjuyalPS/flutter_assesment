import 'package:flutter/material.dart';
import 'package:flutter_assesment/utils/app_alert.dart';
import 'package:flutter_assesment/utils/validators.dart';
import 'package:flutter_assesment/widgets/authbuttonwidget.dart';
import 'package:flutter_assesment/widgets/formfields.dart';
import 'package:flutter_assesment/constants/strings.dart';
import 'package:flutter_assesment/widgets/auth_text_widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with Validator {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          kSignUp,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const AuthTextWidget(text: kSignupIntroText),
              FormFields(
                placeholder: kFirstName,
                validator: validateSimpleField,
              ),
              FormFields(
                placeholder: kLastname,
                validator: validateSimpleField,
              ),
              FormFields(
                placeholder: kEmail,
                validator: validateEmail,
              ),
              FormFields(
                placeholder: kPassword,
                isSecured: true,
                validator: validatePassword,
              ),
              FormFields(
                placeholder: kConfirmPassword,
                isSecured: true,
                validator: validatePassword,
              ),
              AuthButtonWidget(
                label: kSignUp,
                onPressed: _onRegisterClick,
                margin: const EdgeInsets.only(top: 38),
                height: 48,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterClick() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AppAlert(
          title: "Success",
          message: "Registration successful!",
          actionText: "Ok",
          action: () => Navigator.pop(context),
        ),
      );
    }
  }
}
