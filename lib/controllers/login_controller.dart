import 'package:covid_fl/data/repository/login/login_repository.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  onLoginButtonPress(){
    loginRepository.login({"email":"admin@gmail.com","password":"12345678"});
    Get.offAndToNamed(Routes.HOME);
  }
}