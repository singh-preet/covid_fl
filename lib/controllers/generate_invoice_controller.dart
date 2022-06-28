import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/data/models/response_model/add_order_id_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';

class GenerateInvoiceController extends GetxController {
  String category = "";
  String? orderId;
  RxInt currentStep = 0.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController modelNameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  Future<AddOrderIdResponse> addOrderId() async {
    AddOrderIdResponse data = await HttpService.addOrderId({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      'modelId': '1',
      'modelName': modelNameController.text,
      'firstName': fNameController.text,
      'lastName': lNameController.text,
      'email': emailController.text,
      'phone': phoneController.text
    });
    orderId = data.data.oderId;
    update();
    return data;
  }

  Future<UpdateResponse> addServiceToOrderId() async {
    UpdateResponse data = await HttpService.addServiceToOrder({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId),
      'serviceName': serviceController.text,
      'orderId': orderId,
      'amount': amountController.text
    });
    return data;
  }

  updateCategory(String userCategory) {
    category = userCategory;
    update();
  }



  @override
  void dispose() {
    phoneController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    modelNameController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
