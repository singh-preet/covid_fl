import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:covid_fl/data/network/api_service.dart';

class ApiServiceBinds extends Bindings {
  @override
  void dependencies() {
    Dio dioBinds = Get.find();
    Get.lazyPut<ApiService?>(() {
      return ApiService(dioBinds);
    });
  }
}
