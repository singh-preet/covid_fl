import 'package:covid_fl/main/app.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /*initialize Pref*/
  await AppPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(AppPreferences.getString(AppPreferences.userId));
    return App();
  }
}

