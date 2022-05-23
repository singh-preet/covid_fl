import 'package:flutter/material.dart';
import 'package:phone_tech_london/utils/app_colors.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  const BorderContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.lightOrange,
          )),
      child: child,
    );
  }
}
