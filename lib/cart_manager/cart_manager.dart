import 'package:flutter_assesment/models/cart_model.dart';
import 'package:flutter_assesment/models/product_model.dart';

class CartManager {
  CartManager._privateConstructor();
  static final CartManager shared = CartManager._privateConstructor();

  final List<CartItems> _items = [];

  List<CartItems> getItems() {
    return _items;
  }

  void addItem(Product product) {
    final cartItem = CartItems(
        id: product.id,
        name: product.name!,
        amount: product.amount!,
        imageURL: product.image!);
    final index = _items.indexWhere((element) => element.id == cartItem.id);
    if (index == -1) {
      _items.add(cartItem);
    } else {
      _items[index].quantity += 1;
    }
  }

  double getTotalAmount() {
    double sum = _items.fold(
        0, (previousValue, element) => previousValue + element.finalAmount());
    return sum;
  }
}
