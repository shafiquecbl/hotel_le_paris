import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/data/model/response/user.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String token = '';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  // user exist
  Future<bool> isUserExist(String email) async {
    var response =
        await apiClient.postData(AppConstants.checkEmailURL, {'email': email});
    if (response != NO_INTERNET) {
      log(response.body);
      response = jsonDecode(response.body);
      if (response['status'] == true) {
        token = response['token'];
      }
      return response['status'];
    } else {
      return false;
    }
  }

  // get user
  Future<AppUser?> getUser(String email) async {
    var response =
        await apiClient.getData("${AppConstants.getUserURL}?email=$email");
    if (response != NO_INTERNET) {
      log(response.body);
      response = jsonDecode(response.body);
      return AppUser.fromMap(response);
    } else {
      return null;
    }
  }

  // if user not exist save user
  Future<void> saveUser(Map<String, dynamic> data) async {
    await apiClient.postData(AppConstants.storeUserURL, data);
  }

  // update user
  Future<void> updateUser(Map<String, dynamic> data) async {
    await apiClient.postData(AppConstants.updateUserURL, data);
  }

  // upload user image
  Future<void> uploadUserImage(String email, File file, bool image) async {
    await apiClient.postMultipartData(AppConstants.updateUserImage,
        [MultipartBody(image ? 'image' : 'coverImage', XFile(file.path))],
        body: {'email': email});
  }
}
