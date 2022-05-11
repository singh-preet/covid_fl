import 'package:covid_fl/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  onLoginButtonPress(){
    Get.offAndToNamed(Routes.HOME);
  }
}