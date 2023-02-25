import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:http/http.dart';

class RoomRepo {
  final ApiClient apiClient;
  RoomRepo({required this.apiClient});

  Future<Response?> getRoomList() async {
    return await apiClient.getData(AppConstants.getRoomListURL);
  }
}
