import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:http/http.dart';

class ServiceRepo {
  final ApiClient apiClient;
  ServiceRepo({required this.apiClient});

  Future<Response?> getServiceList() async {
    return await apiClient.getData(AppConstants.getRoomListURL);
  }
}
