import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/models/product_model.dart';

abstract class APIClient {
  Future<Products> getProducts(ProductType type);
}

class ProductRepository implements APIClient {
  @override
  Future<Products> getProducts(ProductType type) async {
    final String response = await rootBundle.loadString(_getJSONPathFor(type));
    final data = await json.decode(response);
    return Products.fromJson(data);
  }

  String _getJSONPathFor(ProductType type) {
    switch (type) {
      case ProductType.fruits:
        return 'assets/json/products.json';
      case ProductType.bakery:
        return 'assets/json/bakery.json';
    }
  }
}
