import 'package:covid_fl/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/style_manager.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({Key key}) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Samsung Products',
            style: StyleManager.regularBlack(fontSize: 16),
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Galaxy X9",
                    style: StyleManager.regularWhite(),
                  ),
                ),
              );
            }));
  }
}
