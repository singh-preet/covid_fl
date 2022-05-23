import 'package:phone_tech_london/features/_widgets/border_container.dart';
import 'package:flutter/material.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class ServiceTile extends StatelessWidget {
  final String service, price;

  const ServiceTile({Key? key, required this.service, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(service),
          Text("${StringConstant.GBP}$price"),
        ],
      ),
    );
  }
}
