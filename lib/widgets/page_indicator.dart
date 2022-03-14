import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentPage;

  const PageIndicator({Key? key, required this.count, this.currentPage = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < count; i++)
                if (i == currentPage) ...[circleBar(true)] else
                  circleBar(false),
            ],
          ),
        ),
      ],
    );
  }

  ///--------------------------------
  /// HELPER METHODS
  /// --------------------------------
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? kAuthButtonColor : Colors.grey.shade400,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
