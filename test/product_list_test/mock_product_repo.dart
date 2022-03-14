import 'package:flutter_assesment/models/product_model.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/repository/product_repo.dart';

const mockProduct = Products(
  title: 'apple',
  product: <Product>[
    Product(
        id: 123,
        name: "apple mock",
        description: "qwerty",
        image: "",
        amount: 20)
  ],
);

class MockProductRepo implements APIClient {
  @override
  Future<Products> getProducts(ProductType type) {
    return Future.delayed(const Duration(seconds: 2), () => mockProduct);
  }
}
