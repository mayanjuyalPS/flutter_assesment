import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_state.dart';
import 'package:flutter_assesment/models/product_model.dart';
import 'package:flutter_assesment/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final APIClient repository;
  final ProductType type;
  ProductBloc({required this.repository, required this.type})
      : super(EmptyProduct()) {
    on(
      <FetchProducts>(event, emit) async {
        emit(LoadingProduct());
        try {
          final Products products = await repository.getProducts(type);
          emit(
            LoadedProduct(product: products),
          );
        } catch (e) {
          emit(ErrorProduct());
        }
      },
    );
  }
}
