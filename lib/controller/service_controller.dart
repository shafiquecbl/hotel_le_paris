// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:get/get.dart';
import 'package:hotel_booking/common/snackbar.dart';
import 'package:hotel_booking/data/model/response/service.dart';
import 'package:hotel_booking/data/repository/service_repo.dart';

class ServiceController extends GetxController implements GetxService {
  final ServiceRepo serviceRepo;
  ServiceController({required this.serviceRepo});

  List<ServiceModel> _serviceList = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<ServiceModel> get serviceList => _serviceList;

  Future<void> init({bool reload = false}) async {
    if (_serviceList.isEmpty || reload) {
      _isLoading = true;
      update();
      await getServiceList();
      _isLoading = false;
      update();
    }
  }

  getServiceList() async {
    var response = await serviceRepo.getServiceList();
    if (response != null) {
      _serviceList = (jsonDecode(response.body) as List)
          .map((e) => ServiceModel.fromJson(e))
          .toList();
    } else {
      errorMessage();
    }
    update();
  }

  static ServiceController get to => Get.find();
}
