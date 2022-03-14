import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String? title;
  final List<Product>? product;

  const Products({this.title, this.product});

  static Products fromJson(dynamic json) {
    return Products(
        title: json['title'],
        product: (json['product'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList());
  }

  @override
  List<Object?> get props => [title, product];
}

class Product extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final String? image;
  final double? amount;
  const Product(
      {required this.id, this.name, this.description, this.image, this.amount});

  static Product fromJson(dynamic json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      amount: json['amount'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [id, name, description, image, amount];
}
