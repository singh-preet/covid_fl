import 'package:phone_tech_london/data/models/response_model/edit_brand_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController {
  late TextEditingController brandName;

  initialize(String brandNames) {
    brandName = TextEditingController(text: brandNames);
  }

  clear() {
    brandName.clear();
  }

  Future<EditBrandResponse> editBrand(String brandId, String brandName) async {
    EditBrandResponse res = await HttpService.editBrand({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "brandId": brandId,
      "brandName": brandName,
      "image": ""
    });
    return res;
  }
}
