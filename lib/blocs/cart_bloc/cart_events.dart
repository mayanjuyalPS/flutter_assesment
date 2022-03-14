import 'package:flutter_assesment/models/cart_model.dart';
import 'package:flutter_assesment/models/product_model.dart';

abstract class CartEvents {}

class AddItem extends CartEvents {
  Product item;

  AddItem({required this.item});
}

class RemoveItem extends CartEvents {
  CartItems item;

  RemoveItem({required this.item});
}

class IncreaseQuantity extends CartEvents {
  CartItems items;

  IncreaseQuantity({required this.items});
}

class DecreaseQuantity extends CartEvents {
  CartItems items;

  DecreaseQuantity({required this.items});
}

class ClearCart extends CartEvents {}
