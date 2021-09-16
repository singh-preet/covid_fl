import 'package:covid_fl/controllers/login_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/app_images.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: Container(),),
                Transform.scale(scale: 0.5, child: Image.asset(AppImages.logo)),
                Text(StringConstant.APP_NAME, style: StyleManager.boldWhite(fontSize: 50),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    cursorColor: AppColors.white,
                    style: StyleManager.regularWhite(),
                    decoration: InputDecoration(
                      suffix: Icon(Icons.phone, color: Colors.white70),
                      prefix: Text("+91-", style: StyleManager.regularWhite(),),
                      labelText: "Phone",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      labelStyle: StyleManager.regularWhite(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                MaterialButton(
                  onPressed: controller.onLoginButtonPress,
                  elevation: 3,
                  color: Colors.blue,
                  minWidth: 100,
                  child: Text(StringConstant.LOGIN,
                      style: StyleManager.regularWhite()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                Expanded(child: Container(),),
              ],
            ),
          );
        }
      ),
    );
  }
}
