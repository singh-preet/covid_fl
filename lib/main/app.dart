import 'package:covid_fl/bindings/splash_binding.dart';
import 'package:covid_fl/features/splash_screen/splash_screen.dart';
import 'package:covid_fl/routes/app_pages.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      title: StringConstant.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor
      ),
      home: SplashScreen(),
    );
  }
}
