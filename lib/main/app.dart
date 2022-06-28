import 'package:phone_tech_london/bindings/splash_binding.dart';
import 'package:phone_tech_london/features/splash_screen/splash_screen.dart';
import 'package:phone_tech_london/routes/app_pages.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
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
      initialRoute: (AppPreferences.getString(AppPreferences.userId) != null &&
              AppPreferences.getString(AppPreferences.appId) != null)
          ? Routes.HOME
          : Routes.LOGIN,
      getPages: AppPages.pages,
      title: StringConstant.APP_NAME,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.black),
          primarySwatch: Colors.blue,
          accentColor: AppColors.backgroundColor,
          backgroundColor: AppColors.backgroundColor),
      home: SplashScreen(),
    );
  }
}
