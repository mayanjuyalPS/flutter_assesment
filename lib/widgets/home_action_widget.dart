import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';
import 'package:flutter_assesment/constants/text_style.dart';

class HomeActionWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonLabel;
  final Function() onTap;

  const HomeActionWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonLabel,
      required this.onTap})
      : super(key: key);

  SizedBox createSizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: kHomeTitleStyle,
          ),
          createSizeBox(16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: kHomeDescriptionStyle,
          ),
          createSizeBox(8),
          TextButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kAuthButtonColor),
            ),
            child: Text(
              buttonLabel,
              style: kHomeButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
