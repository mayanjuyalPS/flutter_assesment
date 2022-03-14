import 'package:flutter/material.dart';
import 'package:flutter_assesment/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_assesment/blocs/cart_bloc/cart_events.dart';
import 'package:flutter_assesment/blocs/cart_bloc/cart_state.dart';
import 'package:flutter_assesment/cart_manager/cart_manager.dart';
import 'package:flutter_assesment/constants/image_const.dart';
import 'package:flutter_assesment/constants/strings.dart';
import 'package:flutter_assesment/constants/text_style.dart';
import 'package:flutter_assesment/utils/common_appbar.dart';
import 'package:flutter_assesment/widgets/StepperWdiget/stepper_widget.dart';
import 'package:flutter_assesment/widgets/cart_bottom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with CommonAppBar {
  Widget createHeader({required int itemCount}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(3),
            offset: const Offset(1, 1),
            spreadRadius: 8.0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      margin: const EdgeInsets.only(top: 18, bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          const Text(
            'My Cart',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text('($itemCount Item)'),
        ],
      ),
    );
  }

  Widget createFooter() {
    return SizedBox(
      height: 80,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: const [
              Image(
                image: AssetImage(logo),
                height: 30,
              ),
              Text(kCartFooterText)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWithOnlyBack(),
      body: BlocProvider(
        create: (context) => CartBloc(
          CartState(
              carts: CartManager.shared.getItems(),
              totalAmount: CartManager.shared.getTotalAmount()),
        ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.carts.isEmpty
                ? const Center(
                    child: Text("No items in cart"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.carts.length + 2,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 18,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return createHeader(itemCount: state.carts.length);
                          } else if (index == state.carts.length + 1) {
                            return createFooter();
                          }
                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage(kPlaceholder),
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.carts[index - 1].name,
                                          style: kHomeTitleStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 8,
                                              children: [
                                                StepperWidget(
                                                  onDecrementPress: () {
                                                    if (state
                                                        .carts.isNotEmpty) {
                                                      context
                                                          .read<CartBloc>()
                                                          .add(DecreaseQuantity(
                                                              items: state
                                                                      .carts[
                                                                  index - 1]));
                                                    }
                                                  },
                                                  onIncrementPress: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(IncreaseQuantity(
                                                            items: state.carts[
                                                                index - 1]));
                                                  },
                                                  initialValue: state
                                                      .carts[index - 1]
                                                      .quantity,
                                                  onValueChange: (count) {},
                                                ),
                                                const Icon(Icons.close),
                                                Text(
                                                    'Rs ${state.carts[index - 1].amount.toString()}'),
                                              ],
                                            ),
                                            Text(
                                              'Rs ${state.carts[index - 1].finalAmount().toString()}',
                                              style: kHomeTitleStyle,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      CartBottomWidget(
                        totalAmount: state.totalAmount,
                        tappedProceed: () {
                          context.read<CartBloc>().add(ClearCart());
                          Navigator.popUntil(
                              context, ModalRoute.withName('/home'));
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
