import 'package:flutter/material.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/style_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  const CustomTextField({
    Key? key, required this.controller, required this.labelText,  this.suffixIcon, required this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColors.black,
        style: StyleManager.regularBlack(),
        decoration: InputDecoration(
          suffix: suffixIcon!=null?Icon(suffixIcon, color: Colors.black):null,
          labelText: labelText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26)),
          labelStyle: StyleManager.regularBlack(fontSize: 16),
        ),
      ),
    );
  }
}
