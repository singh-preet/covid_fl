import 'package:covid_fl/data/models/response_model/login_response.dart';
import 'package:covid_fl/data/network/utils/network_error.dart';
import 'package:covid_fl/data/repository/login/login_repository.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  onLoginButtonPress() async {
    Either<NetworkError, LoginResponse> data = await loginRepository
        .login({"email": "admin@gmail.com", "password": "12345678"});
    data.fold((error) => print(error.errorMsg), (response) => print(response));
    Get.offAndToNamed(Routes.HOME);
  }
}
