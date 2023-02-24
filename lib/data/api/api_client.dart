// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/common/snackbar.dart';
import 'package:hotel_booking/data/repository/auth_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

const String NO_INTERNET = 'no internet';

class ApiClient extends GetxService {
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> getData(String uri, {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $headers');
      http.Response response = await http
          .get(Uri.parse(uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return response;
    } catch (e) {
      socketException(e);
      return NO_INTERNET;
    }
  }

  Future<dynamic> postData(String uri, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader:  ${headers ?? _mainHeaders}');
      debugPrint('====> API Body: $body');
      http.Response response = await http
          .post(
            Uri.parse(uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      log(response.body);
      return response;
    } catch (e) {
      socketException(e);
      return NO_INTERNET;
    }
  }

  Future<dynamic> postMultipartData(
      String uri, List<MultipartBody> multipartBody,
      {Map<String, String>? body, Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.MultipartRequest _request =
          http.MultipartRequest('POST', Uri.parse(uri));
      _request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          File _file = File(multipart.file.path);
          _request.files.add(http.MultipartFile(
            multipart.key,
            _file.readAsBytes().asStream(),
            _file.lengthSync(),
            filename: _file.path.split('/').last,
          ));
        }
      }
      if (body != null) {
        _request.fields.addAll(body);
      }
      http.Response _response =
          await http.Response.fromStream(await _request.send());
      return _response;
    } catch (e) {
      socketException(e);
      return NO_INTERNET;
    }
  }

  Future<dynamic> putData(String uri, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.Response _response = await http
          .put(
            Uri.parse(uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return _response;
    } catch (e) {
      socketException(e);
      return NO_INTERNET;
    }
  }

  Future<dynamic> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      http.Response _response = await http
          .delete(
            Uri.parse(uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return _response;
    } catch (e) {
      socketException(e);
      return NO_INTERNET;
    }
  }
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}

String handleError(String body) {
  debugPrint(body);
  var error = jsonDecode(body)['errors'];
  return error[error.keys.toList()[0]]
      .toString()
      .replaceAll('[', '')
      .replaceAll(']', '')
      .toString();
}

String getMessage(String body) {
  debugPrint(body);
  return jsonDecode(body)['message'];
}

socketException(Object e) {
  if (e is SocketException) {
    getSnackBar('Please check your internet connection',
        title: 'No Internet Connection', success: false);
  }
}

Map<String, String> get headers => token.isNotEmpty
    ? {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token',
      }
    : {
        "Content-Type": "application/json",
      };
