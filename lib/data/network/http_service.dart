import 'dart:convert';
import 'package:phone_tech_london/data/models/response_model/add_model_response.dart';
import 'package:phone_tech_london/data/models/response_model/add_order_id_response.dart';
import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/data/models/response_model/category_response.dart';
import 'package:phone_tech_london/data/models/response_model/login_response.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:phone_tech_london/data/models/response_model/service_list_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/network_properties.dart';
import 'package:phone_tech_london/utils/url_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../utils/url_constants.dart';
import '../models/response_model/brand_response.dart';
import '../models/response_model/category_response.dart';
import '../models/response_model/login_response.dart';
import '../models/response_model/models_response.dart';
import '../models/response_model/order_response.dart';
import '../models/response_model/update_response.dart';
import 'network_properties.dart';

class HttpService {
  HttpService._();

  static Future<LoginResponse> login(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.login),
        body: body);
    final value = LoginResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<CategoryResponse> fetchCategories(
      Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchCategory),
        body: body);
    final value = CategoryResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<BrandResponse> fetchBrands(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchBrands),
        body: body);
    final value = BrandResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<ModelsResponse> fetchModels(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchModels),
        body: body);
    final value = ModelsResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<OrdersResponse> fetchOrders(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchOrders),
        body: body);
    final value = OrdersResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<UpdateResponse> addService(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.addService),
        body: body);
    final value = UpdateResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<UpdateResponse> editServices(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.editServices),
        body: body);
    final value = UpdateResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<AddModelResponse> addModel(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.addModel),
        body: body);
    final value = AddModelResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<UpdateResponse> editBrand(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.editBrand),
        body: body);
    final value = UpdateResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<ServiceListModel> fetchServiceList(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchServiceList),
        body: body);
    final value = ServiceListModel.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<AddOrderIdResponse> addOrderId(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.addOrderId),
        body: body);
    final value = AddOrderIdResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<UpdateResponse> addServiceToOrder(Map<String, dynamic> body) async {
    print(NetworkProperties.baseUrl + UrlConstants.addServiceToOrderId);
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.addServiceToOrderId),
        body: body);
    print(jsonDecode(_result.body));
    final value = UpdateResponse.fromJson(jsonDecode(_result.body));
    return value;
  }





}
