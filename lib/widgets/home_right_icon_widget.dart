import 'package:flutter/material.dart';
import 'package:flutter_assesment/widgets/home_action_widget.dart';

class HomeRightIconWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonLabel;
  final Function() onTap;

  const HomeRightIconWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonLabel,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 34),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: HomeActionWidget(
              title: title,
              description: description,
              buttonLabel: buttonLabel,
              onTap: onTap,
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset('assets/images/foodProduct.png'),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
