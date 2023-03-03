// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:get/get.dart';
import 'package:hotel_booking/common/snackbar.dart';
import 'package:hotel_booking/data/model/response/food.dart';
import 'package:hotel_booking/data/repository/food_repo.dart';

class FoodController extends GetxController implements GetxService {
  final FoodRepo foodRepo;
  FoodController({required this.foodRepo});

  List<FoodModel> _foodList = [];
  List<FoodModel> _filteredList = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<FoodModel> get foodList => _foodList;
  List<FoodModel> get filteredList => _filteredList;

  Future<void> init({bool reload = false}) async {
    if (_foodList.isEmpty || reload) {
      _isLoading = true;
      update();
      await getFoodList();
      _isLoading = false;
      update();
    }
  }

  getFoodList() async {
    var response = await foodRepo.getFoodList();
    if (response != null) {
      _foodList = (jsonDecode(response.body) as List)
          .map((e) => FoodModel.fromJson(e))
          .toList();
      _filteredList = _foodList;
    } else {
      errorMessage();
    }
    update();
  }

  searchFood(String query) {
    if (query.isEmpty) {
      _filteredList = _foodList;
    } else {
      _filteredList = _foodList
          .where(
              (food) => food.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  static FoodController get to => Get.find();
}
