import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Image.asset(AppImages.logo),

    );
  }
}
