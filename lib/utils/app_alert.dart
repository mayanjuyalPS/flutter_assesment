import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';

class AppAlert extends StatelessWidget {
  final String title;
  final String message;
  final String actionText;
  final Function()? action;

  const AppAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.actionText,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //this right here
      child: SizedBox(
        //height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (action != null) {
                    action!();
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kAuthButtonColor),
                ),
                child: Text(
                  actionText,
                  style: const TextStyle(fontSize: 15.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
