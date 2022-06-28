import 'package:phone_tech_london/data/models/response_model/service_list_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailController extends GetxController {
  late TextEditingController charges;
  late List<Data> serviceListFromApi = List.empty(growable: true);
  List<DropdownMenuItem> items = List.empty(growable: true);
  late ServiceListModel data;

  fetchServiceList() async {
    data = await HttpService.fetchServiceList({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    print("fetchServiceList : $data");
  }

  List<DropdownMenuItem> getServiceDropDown(String? categoryId) {
    serviceListFromApi = categoryId != null
        ? data.data
            .where((element) => element.serviceCategory == categoryId)
            .toList()
        : data.data.toList();
    items = serviceListFromApi
        .map((e) => DropdownMenuItem(
              child: Text(e.title),
              value: e.title,
            ))
        .toList();
    return items;
  }

  initialize(String charge) {
    charges = TextEditingController(text: charge);
  }

  clear() {
    charges.clear();
  }

  Future<UpdateResponse> updateService(String id, String amount) async {
    UpdateResponse res = await HttpService.editServices({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "amount": amount,
      "serviceId": id
    });
    return res;
  }

  Future<UpdateResponse> addService(
      {required String id,
      required String amount,
      required String modelId}) async {
    UpdateResponse res = await HttpService.addService({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "amount": amount,
      "serviceId": id,
      "modelId": modelId
    });
    return res;
  }

  // Future<UpdateResponse> addServiceToOrder({required String orderId}) async {
  //   UpdateResponse res = await HttpService.addServiceToOrder({
  //     "userId": AppPreferences.getString(AppPreferences.userId),
  //     "appId": AppPreferences.getString(AppPreferences.appId),
  //     "orderId": orderId
  //   });
  //   return res;
  // }
}

class ServiceDropDownModel {
  late String id;
  late String name;
  ServiceDropDownModel(this.id, this.name);
}
