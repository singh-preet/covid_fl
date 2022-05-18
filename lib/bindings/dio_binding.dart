import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DioBinds extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() {
      Dio dio = Dio();
      return dio;
    });
  }
}