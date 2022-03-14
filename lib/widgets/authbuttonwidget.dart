import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';

class AuthButtonWidget extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final Function() onPressed;

  const AuthButtonWidget(
      {Key? key,
      required this.label,
      this.margin,
      required this.onPressed,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        color: kAuthButtonColor,
      ),
    );
  }
}
