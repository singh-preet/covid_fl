import 'package:flutter/cupertino.dart';
import 'package:phone_tech_london/data/models/response_model/add_model_response.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  late TextEditingController newModelName;

  initialize(){
    newModelName= TextEditingController();
  }

  clear(){
    newModelName.clear();
  }

  Future<ModelsResponse> getModels(String brandId) async {
    ModelsResponse data = await HttpService.fetchModels({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "brandId": brandId
    });
    return data;
  }

  Future<AddModelResponse> addModel({required String brandId, required String modelName}) async{
    AddModelResponse res = await HttpService.addModel({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "brandId":brandId,
      "modelName":modelName,
      "image":""
    });
    return res;

  }


}
