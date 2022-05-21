import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailController extends GetxController {
  late TextEditingController charges;

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
}
