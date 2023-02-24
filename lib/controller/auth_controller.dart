import 'package:get/get.dart';
import 'package:hotel_booking/data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  static AuthController get to => Get.find();
}
