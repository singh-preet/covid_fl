import 'package:phone_tech_london/controllers/login_controller.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/app_images.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<LoginController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Transform.scale(scale: 1.5, child: Image.asset(AppImages.logo)),
              CustomTextField(controller: controller.email,labelText: StringConstant.email, suffixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
              CustomTextField(controller: controller.password,labelText: StringConstant.password, suffixIcon: Icons.remove_red_eye, keyboardType:TextInputType.visiblePassword),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: TextFormField(
              //     controller: controller.password,
              //     keyboardType: TextInputType.visiblePassword,
              //     cursorColor: AppColors.black,
              //     style: StyleManager.regularBlack(),
              //     decoration: InputDecoration(
              //       suffix: Icon(Icons.remove_red_eye, color: Colors.black),
              //       labelText: "Password",
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.orange),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.orange),
              //       ),
              //       border: UnderlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black26)),
              //       labelStyle: StyleManager.regularBlack(fontSize: 16),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: controller.onLoginButtonPress,
                elevation: 3,
                color: AppColors.lightOrange,
                minWidth: 100,
                child: Text(StringConstant.LOGIN,
                    style: StyleManager.regularBlack()),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        );
      }),
    );
  }
}

