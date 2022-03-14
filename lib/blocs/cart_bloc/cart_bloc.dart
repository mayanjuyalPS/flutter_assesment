import 'package:flutter_assesment/blocs/cart_bloc/cart_events.dart';
import 'package:flutter_assesment/blocs/cart_bloc/cart_state.dart';
import 'package:flutter_assesment/models/cart_model.dart';
import 'package:flutter_assesment/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc(CartState initialState) : super(initialState) {
    on(<CartEvents>(event, emit) {
      if (event is AddItem) {
        _addItems(event, emit);
      }
      if (event is RemoveItem) {
        _removeItem(event, emit);
      }
      if (event is IncreaseQuantity) {
        _onIncreasingQuantity(event, emit);
      }
      if (event is DecreaseQuantity) {
        _onDecreasingQuantity(event, emit);
      }
      if (event is ClearCart) {
        _onClearCart();
      }
    });
  }

  void _addItems(AddItem event, Emitter<CartState> emit) {
    Product product = event.item;
    state.carts.add(CartItems(
        id: product.id,
        name: product.name!,
        amount: product.amount!,
        imageURL: product.image!));
    emit(CartState(carts: state.carts, totalAmount: _getTotalAmount()));
  }

  void _removeItem(RemoveItem event, Emitter<CartState> emit) {
    final index =
        state.carts.indexWhere((element) => element.id == event.item.id);
    if (event.item.quantity == 1) {
      state.carts.removeAt(index);
    } else {
      state.carts[index].quantity--;
    }
    emit(CartState(carts: state.carts, totalAmount: _getTotalAmount()));
  }

  void _onIncreasingQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final index =
        state.carts.indexWhere((element) => element.id == event.items.id);
    state.carts[index].quantity++;
    emit(CartState(carts: state.carts, totalAmount: _getTotalAmount()));
  }

  void _onDecreasingQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final index =
        state.carts.indexWhere((element) => element.id == event.items.id);
    if (event.items.quantity == 1) {
      state.carts.removeAt(index);
    } else {
      state.carts[index].quantity--;
    }
    emit(CartState(carts: state.carts, totalAmount: _getTotalAmount()));
  }

  void _onClearCart() {
    state.carts.clear();
  }

  double _getTotalAmount() {
    double sum = state.carts.fold(
        0, (previousValue, element) => previousValue + element.finalAmount());
    return sum;
  }
}
