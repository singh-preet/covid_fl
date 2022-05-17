import 'package:covid_fl/data/network/network_properties.dart';
import 'package:retrofit/retrofit.dart';
import 'package:covid_fl/utils/url_constants.dart';
import '../models/response_model/login_response.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';


@RestApi(baseUrl: NetworkProperties.baseUrl)
//flutter pub run build_runner build
// or
//flutter clean
//flutter pub get
//flutter packages pub run build_runner build --delete-conflicting-outputs

abstract class ApiService {
  factory ApiService(Dio dioBinds, {String? baseUrl}) {
    return _ApiService( dioBinds, baseUrl: baseUrl);
  }

@POST(UrlConstants.login)
Future<HttpResponse<LoginResponse>> login();

}
