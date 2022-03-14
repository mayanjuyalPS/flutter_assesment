import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class EmptyProduct extends ProductState {
  @override
  List<Object?> get props => [];
}

class LoadingProduct extends ProductState {
  @override
  List<Object?> get props => [];
}

class LoadedProduct extends ProductState {
  final Products product;
  const LoadedProduct({required this.product});

  @override
  List<Object?> get props => [product];
}

class ErrorProduct extends ProductState {
  @override
  List<Object?> get props => [];
}
