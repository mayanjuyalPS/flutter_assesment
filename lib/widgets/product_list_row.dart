import 'package:flutter/material.dart';
import 'package:flutter_assesment/widgets/authbuttonwidget.dart';

class ProductListRow extends StatelessWidget {
  final String name;
  final String description;
  final String btnAmount;
  final String image;
  final Function() itemSelected;

  const ProductListRow({
    Key? key,
    required this.name,
    required this.description,
    required this.btnAmount,
    required this.image,
    required this.itemSelected,
  }) : super(key: key);

  SizedBox createBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          createBox(18),
          Row(
            children: [
              Expanded(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/foodProduct.png',
                  image: image,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[200],
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 11.0),
                      ),
                    ),
                    createBox(20),
                    AuthButtonWidget(
                        label: "Buy $btnAmount", onPressed: itemSelected)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
