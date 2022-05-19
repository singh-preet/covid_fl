import 'dart:convert';
import 'package:covid_fl/data/models/request_model/fetch_category_request.dart';
import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/data/models/response_model/category_response.dart';
import 'package:covid_fl/data/models/response_model/login_response.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/data/network/network_properties.dart';
import 'package:covid_fl/utils/url_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/request_model/fetch_models_request.dart';

class HttpService {
  HttpService._();

  static Future<LoginResponse> login(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.login),
        body: body);
    final value = LoginResponse.fromJson(jsonDecode(_result.body));
    print(jsonDecode(_result.body));

    return value;
  }

  static Future<CategoryResponse> fetchCategories(
      Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchCategory),
        body: body);
    final value = CategoryResponse.fromJson(jsonDecode(_result.body));
    print(jsonDecode(_result.body));
    return value;
  }

  //ToDo: Incorrect Model
  static Future<BrandResponse> fetchBrands(
      Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchBrands),
        body: body);
    final value = BrandResponse.fromJson(jsonDecode(_result.body));
    print(jsonDecode(_result.body));
    return value;
  }

  static Future<ModelsResponse> fetchModels(
      Map<String, dynamic> body) async {
    print(body);
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchModels),
        body: body);
    print(jsonDecode(_result.body));
    final value = ModelsResponse.fromJson(jsonDecode(_result.body));
    print(value.data);
    return value;
  }
}
