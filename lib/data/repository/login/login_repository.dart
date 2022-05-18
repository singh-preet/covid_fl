import 'package:covid_fl/data/models/response_model/login_response.dart';
import 'package:covid_fl/data/network/api_service.dart';
import 'package:covid_fl/data/network/utils/network_error.dart';
import 'package:covid_fl/data/network/utils/safe_api_call.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  // final Dio dioBind;
  final ApiService? apiService;

  LoginRepository({required this.apiService});

  Future<Either<NetworkError, LoginResponse>> login(
      Map<String, dynamic> body) async {
    final data = await safeApiCall(apiService!.login(body));
    return data.fold((l) => Left(l), (r) {
      return Right(r.data);
    });
  }
}