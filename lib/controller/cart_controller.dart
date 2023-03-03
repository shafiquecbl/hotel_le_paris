// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:hotel_booking/data/repository/cart_repo.dart';

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  static CartController get to => Get.find();
}
