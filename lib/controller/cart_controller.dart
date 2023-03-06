// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:hotel_booking/common/snackbar.dart';
import 'package:hotel_booking/data/model/body/cart.dart';
import 'package:hotel_booking/data/model/response/addons.dart';
import 'package:hotel_booking/data/model/response/food.dart';
import 'package:hotel_booking/data/repository/cart_repo.dart';
import 'package:hotel_booking/helper/navigation.dart';

import 'food_controller.dart';

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;
  final FoodController foodController;
  CartController({required this.cartRepo, required this.foodController});

  List<CartItem> _cartList = [];

  List<CartItem> get cartList => _cartList;

  addToCart(CartItem cartItem) {
    _cartList.add(cartItem);
    cartRepo.addToCartList(_cartList);
    pop();
    getSnackBar('Added to cart');
    update();
  }

  removeFromCart(CartItem cartItem) {
    _cartList.remove(cartItem);
    cartRepo.addToCartList(_cartList);
    update();
  }

  addQuantity(CartItem cartItem) {
    cartItem.quantity++;
    cartRepo.addToCartList(_cartList);
    update();
  }

  removeQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      cartRepo.addToCartList(_cartList);
      update();
    } else {
      removeFromCart(cartItem);
    }
  }

  FoodModel getProductById(int id) {
    return foodController.foodList.firstWhere((element) => element.id == id);
  }

  getCartList() {
    _cartList = cartRepo.getCartList();
    update();
  }

  getItemPrice() {
    double price = 0;
    for (var item in cartList) {
      FoodModel product = CartController.to.getProductById(item.prodctId);
      price += product.price! * item.quantity;
    }
    return price;
  }

  getAddonsPrice() {
    double price = 0;
    for (var item in cartList) {
      FoodModel product = CartController.to.getProductById(item.prodctId);
      for (var addonId in item.addonIds) {
        Addon addon =
            product.addons!.firstWhere((element) => element.id == addonId);
        price += addon.price! * item.quantity;
      }
    }
    return price;
  }

  static CartController get to => Get.find();
}
