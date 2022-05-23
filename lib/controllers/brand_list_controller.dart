import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController {
  late TextEditingController brandName = TextEditingController();

  initialize(String name) {
    brandName = TextEditingController(text: name);
  }

  clear() {
    brandName.clear();
  }

  Future<UpdateResponse> editBrand({required String brandId, required String brandName}) async {
    UpdateResponse res = await HttpService.editBrand({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "brandId": brandId,
      "brandName": brandName,
      "image": ""
    });
    return res;
  }
}
