import 'package:flutter/material.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_bloc.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_event.dart';
import 'package:flutter_assesment/blocs/product_list_bloc.dart/product_state.dart';
import 'package:flutter_assesment/cart_manager/cart_manager.dart';
import 'package:flutter_assesment/constants/colors.dart';
import 'package:flutter_assesment/models/product_model.dart';
import 'package:flutter_assesment/repository/product_repo.dart';
import 'package:flutter_assesment/utils/common_appbar.dart';
import 'package:flutter_assesment/widgets/product_list_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  final ProductRepository repository;

  const ProductListScreen({Key? key, required this.repository})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with CommonAppBar {
  //late ProductBloc _bloc;

  @override
  Widget build(BuildContext context) {
    final ProductType args =
        ModalRoute.of(context)?.settings.arguments as ProductType;
    return BlocProvider(
      create: (context) =>
          ProductBloc(repository: widget.repository, type: args)
            ..add(
              FetchProducts(value: args),
            ),
      child: Scaffold(
        appBar: createAppBarWithBack(onTap: () {
          Navigator.pushNamed(context, '/cart');
        }),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is LoadingProduct) {
              return startLoading();
            }
            if (state is LoadedProduct) {
              return createBody(products: state.product);
            }
            if (state is ErrorProduct) {
              return const Center(
                child: Text('Error'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget startLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget createBody({required Products products}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: kAuthButtonColor,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                products.title!,
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: createRows(products.product, context),
          ),
        ),
      ],
    );
  }

  List<Widget> createRows(List<Product>? products, BuildContext context) {
    List<ProductListRow> productRow = [];
    if (products != null) {
      for (var element in products) {
        productRow.add(ProductListRow(
          name: element.name.toString(),
          description: element.description.toString(),
          btnAmount: 'Rs ${element.amount.toString()}',
          image: element.image.toString(),
          itemSelected: () {
            //print(element.amount);
            CartManager.shared.addItem(element);
          },
        ));
      }
    }
    return productRow;
  }
}
