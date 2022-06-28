import 'package:phone_tech_london/data/models/response_model/login_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/data/repository/login/login_repository.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  onLoginButtonPress() async {
    LoginResponse data = await HttpService.login(
        {"email": email.text, "password": password.text});
    if (data.status == 200) {
      AppPreferences.setString("appId", data.appId);
      AppPreferences.setString("userId", data.userId);
      Get.offAndToNamed(Routes.HOME);
    } else {
      Get.rawSnackbar(message: data.message);
    }
  }
}
