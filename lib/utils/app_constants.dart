// ignore_for_file: constant_identifier_names

import 'package:hotel_booking/data/model/body/language.dart';
import 'images.dart';

class AppConstants {
  static const String APP_NAME = 'Hotel Le Paris';

  // API's
  static const String domain = 'https://hotel.dcodax.net';
  static const String baseURL = '$domain/api/frontend';
  static const String checkEmailURL = '$baseURL/check_email';
  static const String getUserURL = '$baseURL/users/get';
  static const String storeUserURL = '$baseURL/users/store';
  static const String updateUserURL = '$baseURL/users/update-user';
  static const String updateUserImage = '$baseURL/users/update-image';

  // Shared Key
  static const String THEME = 'theme';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  // Language
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.spanish,
        languageName: 'Spanish',
        countryCode: 'ES',
        languageCode: 'es'),
  ];
}
