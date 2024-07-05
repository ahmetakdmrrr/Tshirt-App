import 'dart:async';
import 'package:t_shirt_app/models/cart.dart';
import 'package:t_shirt_app/repository/cart_service.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;
  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
