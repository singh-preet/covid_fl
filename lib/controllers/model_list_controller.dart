import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/data/network/http_service.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:get/get.dart';


class ProductListController extends GetxController {
  Future<ModelsResponse> getModels(String brandId) async {
    ModelsResponse data = await HttpService.fetchModels({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      "brandId": brandId
    });
    return data;
  }
}
