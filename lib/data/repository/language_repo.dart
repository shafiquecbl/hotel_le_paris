import 'package:hotel_booking/data/model/language.dart';
import 'package:hotel_booking/utils/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstants.languages;
  }
}
