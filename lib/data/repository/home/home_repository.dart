import 'package:phone_tech_london/data/models/response_model/login_response.dart';
import 'package:phone_tech_london/data/network/api_service.dart';
import 'package:phone_tech_london/data/network/utils/network_error.dart';
import 'package:phone_tech_london/data/network/utils/safe_api_call.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio dioBind;
  final ApiService? apiService;

  HomeRepository({required this.apiService, required this.dioBind});

  // Future<Either<NetworkError, LoginResponse>> login(
  //     Map<String, dynamic> body) async {
  //   final data = await safeApiCall(apiService!.login(data: body));
  //   return data.fold((l) => Left(l), (r) {
  //     return Right(r.data);
  //   });
  // }
}
