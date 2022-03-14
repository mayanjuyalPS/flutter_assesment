class Carts {
  List<CartItems> carts = [];
}

class CartItems {
  final int id;
  final String name;
  final double amount;
  final String imageURL;
  int quantity = 1;

  double finalAmount() {
    return quantity * amount;
  }

  CartItems(
      {required this.id,
      required this.name,
      required this.amount,
      required this.imageURL});
}
