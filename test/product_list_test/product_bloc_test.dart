import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_bloc.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_product_repo.dart';

void main() {
  group('Product list bloc', () {
    late ProductBloc bloc;
    MockProductRepo repo;

    setUp(() {
      EquatableConfig.stringify = true;
      repo = MockProductRepo();
      bloc = ProductBloc(repository: repo, type: ProductType.fruits);
    });

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingProduct, Loaded Product] states for successful task loads',
      build: () => bloc,
      act: (val) => val.add(FetchProducts(value: ProductType.fruits)),
      wait: const Duration(seconds: 2),
      expect: () =>
          [LoadingProduct(), const LoadedProduct(product: mockProduct)],
    );

    tearDown(() {
      bloc.close();
    });
  });
}
