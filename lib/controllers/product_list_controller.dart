import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/data/network/http_service.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:get/get.dart';

class ProductListModel {
  ProductListModel(
      {required this.serviceName, required this.price, required this.prodName});

  final String prodName, serviceName, price;
}

class ProductListController extends GetxController {
  Future<ModelsResponse> getModels() async {
    ModelsResponse data = await HttpService.fetchModels({
      "userId": AppPreferences.userId,
      "appId": AppPreferences.appId,
      "brandId": "2"
    });
    print(data.message);
    return data;
  }

  List<ProductListModel> productData = [
    ProductListModel(
        prodName: "Galaxy S9", serviceName: "Broken LCD", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S9 Plus", serviceName: "Broken Glass", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S8", serviceName: "Audio Issue", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S8 Plus",
        serviceName: "Charging Port",
        price: "\$20"),
  ];
}
