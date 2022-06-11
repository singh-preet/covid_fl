import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class CommonDialog {
  static dialog(
      {required BuildContext context,
      required String title,
      required String actionText,
      required TextEditingController textController,
      required Function onTap,required dynamic controller}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  IconButton(
                      icon: Icon(Icons.clear), onPressed: () => Get.back())
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: textController,
                    decoration: InputDecoration(labelText: StringConstant.model_name),
                  )
                ],
              ),
              actions: [
                OutlinedButton(
                    onPressed: () async {
                      onTap();
                      controller.clear();
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: Text(actionText))
              ],
            ));
  }
}
