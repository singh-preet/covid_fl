import 'package:covid_fl/controllers/product_detail_controller.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/style_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  final List<ProductDetailModel> data;
  final String prodName;

  const ProductDetailScreen({Key key, this.data, this.prodName})
      : super(key: key);

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
          prodName,
          style: StyleManager.regularBlack(fontSize: 16),
        ),
      ),
      body: buildBody(data),
    );
  }
}

Widget buildBody(List<ProductDetailModel> data) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        child: Transform.scale(scale: 1.5, child: Image.asset(AppImages.logo)),
      ),
      Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            'Choose services from the list',
            style: StyleManager.bold(color: AppColors.black),
          )),
      Expanded(
        child: ListView.builder(
            physics: ScrollPhysics(),
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, top: 10, right: 25, bottom: 16),
                    child: DetailWidget(
                        price: data[index].price,
                        prodName: data[index].prodName),
                  ),
                ],
              );
            }),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 12, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringConstant.TOTAL,
              style: StyleManager.bold(color: AppColors.black, fontSize: 18),
            ),
            MaterialButton(
              onPressed: () {},
              height: 40,
              child: Text(
                "NaN",
                style: StyleManager.regularBlack(),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: AppColors.greyColor,
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {},
              height: 40,
              child: Text(
                StringConstant.PROCEED_TO_PAY,
                style: StyleManager.regularWhite(),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: AppColors.lightOrange,
            )
          ],
        ),
      )
    ],
  );
}

class DetailWidget extends StatelessWidget {
  final String prodName, price;

  const DetailWidget({Key key, this.prodName, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(prodName),
        Text(price),
      ],
    );
  }
}
