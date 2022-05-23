import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailController extends GetxController {
  late TextEditingController charges;
  List<DropdownMenuItem> items = [
    ServiceDropDownModel("1","Broken LCD"),
    ServiceDropDownModel("2","Back Glass"),
    ServiceDropDownModel("3","Audio Issue"),
    ServiceDropDownModel("4","Charging Port"),
    ServiceDropDownModel("5","Front Camera"),
    ServiceDropDownModel("6","Rear Camera"),
    ServiceDropDownModel("7","Battery"),
    ServiceDropDownModel("8","Diagnostics"),
  ].map((e) => DropdownMenuItem(child: Text(e.name), value: e.id,)).toList();

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

  Future<UpdateResponse>
  addService(
      {required String id,
      required String amount,
      required String modelId}) async {
    print(modelId);
    print(id);
    UpdateResponse res = await HttpService.addService({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "amount": amount,
      "serviceId": id,
      "modelId": modelId
    });
    return res;
  }
}

class ServiceDropDownModel{
  late String id;
  late String name;
  ServiceDropDownModel(this.id, this.name);
}