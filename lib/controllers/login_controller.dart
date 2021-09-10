import 'package:covid_fl/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{



  onLoginButtonPress(){
    Get.offAndToNamed(Routes.HOME);
    // _sentOTP == false
    //     ? setState(() {
    //   _isLoading = true;
    //   getOTP();
    // })
    //     : setState(() {
    //   _isLoading = true;
    //   loginWithOTP();
    // });
  }
}