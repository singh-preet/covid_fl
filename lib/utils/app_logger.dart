import 'package:flutter/material.dart';

class AppLogger {
  AppLogger._();

  /// This method is used to print the message passed to it in the logcat.
  static void printLog(var msg) {

    debugPrint(msg);
  }

}
