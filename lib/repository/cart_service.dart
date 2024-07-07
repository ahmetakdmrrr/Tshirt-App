import 'package:t_shirt_app/models/cart.dart';

class CartService {
  static List<Cart> cartItems = [];
  static final CartService _singleton = CartService._internal();
  factory CartService() => _singleton;
  CartService._internal();

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeToCart(Cart item) {
    cartItems.remove(item);
  }
  

  static List<Cart> getCart() {
    return cartItems;
  }
}
