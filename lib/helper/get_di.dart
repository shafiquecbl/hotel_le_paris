import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/controller/categories_controller.dart';
import 'package:hotel_booking/controller/food_controller.dart';
import 'package:hotel_booking/controller/localization_controller.dart';
import 'package:hotel_booking/controller/theme_controller.dart';
import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/data/model/body/language.dart';
import 'package:hotel_booking/data/repository/auth_repo.dart';
import 'package:hotel_booking/data/repository/category_repo.dart';
import 'package:hotel_booking/data/repository/food_repo.dart';
import 'package:hotel_booking/data/repository/language_repo.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient());

  // Repository
  Get.lazyPut(() => LanguageRepo());
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => FoodRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
  Get.lazyPut(() => FoodController(foodRepo: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }
  return languages;
}
