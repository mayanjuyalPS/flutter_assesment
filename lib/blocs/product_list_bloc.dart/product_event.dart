import 'package:equatable/equatable.dart';

enum ProductType { fruits, bakery }

abstract class ProductEvents extends Equatable {}

class FetchProducts extends ProductEvents {
  final ProductType value;
  FetchProducts({required this.value});

  @override
  List<Object?> get props => [value];
}
