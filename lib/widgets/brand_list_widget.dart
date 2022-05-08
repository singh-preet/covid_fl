import 'package:covid_fl/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/style_manager.dart';

class BrandListWidget extends StatelessWidget {
  const BrandListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductListWidget()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.lightOrange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Samsung",
                  style: StyleManager.regularWhite(),
                ),
                Icon(
                  Icons.edit,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
