import 'package:phone_tech_london/controllers/login_controller.dart';
import 'package:phone_tech_london/data/network/api_service.dart';
import 'package:phone_tech_london/data/repository/login/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    ApiService? apiService = Get.find();

    LoginRepository loginRepository =
        Get.put(LoginRepository(apiService: apiService));
    Get.lazyPut<LoginController>(() {
      return LoginController(loginRepository);
    });
  }
}
