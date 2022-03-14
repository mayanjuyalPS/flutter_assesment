import 'package:flutter/material.dart';
import 'package:flutter_assesment/utils/validators.dart';
import 'package:flutter_assesment/widgets/authbuttonwidget.dart';
import 'package:flutter_assesment/widgets/formfields.dart';
import 'package:flutter_assesment/constants/strings.dart';
import 'package:flutter_assesment/widgets/auth_text_widgets.dart';

class LoginScreen extends StatefulWidget with Validator {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validator {
  final formKey = GlobalKey<FormState>();

  late String _email, _password;

  void onPressedSignup(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void onLoginPressed() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          kLogin,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const AuthTextWidget(
                text: kLoginIntroText,
              ),
              FormFields(
                placeholder: kEmail,
                validator: validateEmail,
                onSaved: (email) => _email = email!,
              ),
              FormFields(
                placeholder: kPassword,
                isSecured: true,
                validator: validatePassword,
                onSaved: (password) => _password = password!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(kNewHere),
                  TextButton(
                    onPressed: () {
                      onPressedSignup(context);
                    },
                    child: const Text(kSignUp),
                  )
                ],
              ),
              AuthButtonWidget(
                label: kLogin,
                height: 48,
                onPressed: onLoginPressed,
                margin: const EdgeInsets.only(top: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
