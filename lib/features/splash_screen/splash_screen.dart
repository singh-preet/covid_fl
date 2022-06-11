import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final ServiceDetailController serviceDetailController = Get.put(ServiceDetailController());
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    serviceDetailController.fetchServiceList();
    return Container(
      color: AppColors.backgroundColor,
      child: Image.asset(AppImages.logo),
    );
  }
}
