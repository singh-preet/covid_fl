import 'package:covid_fl/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleManager{
  StyleManager._();

  static TextStyle boldWhite({double fontSize}){
    return TextStyle(
        fontSize: fontSize??17,
        color: AppColors.white,
        fontWeight: FontWeight.bold);
  }

  static TextStyle regularWhite({double fontSize}){
    return TextStyle(
        fontSize: fontSize??14,
        color: AppColors.white);
  }

  static TextStyle greenBold = TextStyle(
      color: Colors.green, fontWeight: FontWeight.bold);

  static TextStyle greyRegular = TextStyle(
  color: Colors.grey,
  );






}