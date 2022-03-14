import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';
import 'package:flutter_assesment/constants/image_const.dart';

mixin CommonAppBar {
  AppBar createAppBar({Function()? onTap}) {
    return AppBar(
      //automaticallyImplyLeading: false,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Image(image: AssetImage(logo)),
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 18),
            child: const Icon(
              Icons.shopping_cart,
              color: kAuthButtonColor,
            ),
          ),
        ),
      ],
    );
  }

  AppBar createAppBarWithBack({Function()? onTap}) {
    return AppBar(
      leading: backButton,
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 18),
            child: const Icon(
              Icons.shopping_cart,
              color: kAuthButtonColor,
            ),
          ),
        ),
      ],
    );
  }

  AppBar createAppBarWithOnlyBack() {
    return AppBar(
      leading: backButton,
    );
  }

  final backButton = const BackButton(
    color: Colors.black,
  );
}
