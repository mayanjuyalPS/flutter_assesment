import 'package:flutter_assesment/models/cart_model.dart';

abstract class CartStates {}

class CartState extends CartStates {
  List<CartItems> carts;
  double totalAmount;
  CartState({required this.carts, required this.totalAmount});
}
