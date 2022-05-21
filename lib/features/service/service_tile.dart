import 'package:covid_fl/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final String service, price;

  const ServiceTile({Key? key, required this.service, required this.price})
      : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(service),
          Text("£$price"),
        ],
      ),
    );
  }
}
