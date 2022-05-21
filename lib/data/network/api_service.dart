import 'package:phone_tech_london/data/models/request_model/fetch_brand_request.dart';
import 'package:phone_tech_london/data/models/request_model/fetch_models_request.dart';
import 'package:phone_tech_london/data/models/request_model/login_request.dart';
import 'package:phone_tech_london/data/network/network_properties.dart';
import 'package:retrofit/retrofit.dart';
import 'package:phone_tech_london/utils/url_constants.dart';
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
  factory ApiService(Dio dioBinds) {
    return _ApiService(dioBinds, baseUrl: NetworkProperties.baseUrl);
  }

  @POST(UrlConstants.login)
  Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest data);

  @POST(UrlConstants.fetchBrands)
  Future<HttpResponse<LoginResponse>> fetchBrands(
      @Body() FetchBrandRequest data);

  @POST(UrlConstants.fetchCategory)
  Future<HttpResponse<LoginResponse>> fetchCategories(
      @Body() FetchCategoryRequest data);
}
