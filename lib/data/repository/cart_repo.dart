import 'dart:convert';
import 'package:hotel_booking/data/model/body/cart.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<CartItem> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST) ?? [];
    }
    List<CartItem> cartList = [];
    for (var cart in carts) {
      cartList.add(CartItem.fromJson(jsonDecode(cart)));
    }
    return cartList;
  }

  void addToCartList(List<CartItem> cartProductList) {
    List<String> carts = [];
    for (var cartModel in cartProductList) {
      carts.add(jsonEncode(cartModel));
    }
    sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
  }
}
