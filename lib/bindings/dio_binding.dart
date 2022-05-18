import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBinds extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() {
      Dio dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (log) {
          return debugPrint(log.toString());
        },
      ));
      return dio;
    });
  }
}