import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';
import 'package:flutter_assesment/constants/strings.dart';
import 'package:flutter_assesment/utils/app_alert.dart';

class CartBottomWidget extends StatelessWidget {
  final double totalAmount;
  final Function() tappedProceed;

  CartBottomWidget(
      {Key? key, required this.totalAmount, required this.tappedProceed})
      : super(key: key);

  final _containerShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 10,
    blurRadius: 5,
    offset: const Offset(0, 7), // changes position of shadow
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          _containerShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Visibility(
            child: Text(
              kPromoTextDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            visible: true,
          ),
          const SizedBox(
            height: 16,
          ),
          _proceedButton(
            amount: 'Rs. ${totalAmount.toStringAsFixed(2)}',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _proceedButton(
      {required String amount, required BuildContext context}) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AppAlert(
            title: "Congrats",
            message: 'Your order has been placed succesfully',
            actionText: "Ok",
            action: tappedProceed,
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kAuthButtonColor),
        fixedSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            48,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              kProceedToCheckout,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Wrap(
              spacing: 12.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 10.0,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
