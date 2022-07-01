import 'package:phone_tech_london/features/task_module/task_completion_status.dart';
import 'package:phone_tech_london/main/app.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*initialize Pref*/
  await AppPreferences.getInstance();
  runApp(MyApp3());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return App();
  }
}
