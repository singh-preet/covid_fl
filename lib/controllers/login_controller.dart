import 'package:covid_fl/data/models/response_model/login_response.dart';
import 'package:covid_fl/data/network/http_service.dart';
import 'package:covid_fl/data/repository/login/login_repository.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();


  onLoginButtonPress() async {
    print(email.text);
    print(password.text);
    LoginResponse data = await HttpService.login(
        {"email": email.text, "password": password.text});
    if( data.status==200){
      AppPreferences.setString("appId", data.appId);
      AppPreferences.setString("userId", data.userId);
      Get.offAndToNamed(Routes.HOME);
    }else{
      Get.rawSnackbar(message: data.message);
    }

  }
}
