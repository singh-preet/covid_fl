import 'package:covid_fl/controllers/product_detail_controller.dart';
import 'package:flutter/material.dart';

import 'package:covid_fl/data/models/response_model/models_response.dart';

class ProductDetailScreen extends StatelessWidget {
  final List<ProductDetailModel> data;
  final String prodName;
  final List<ServiceList> serviceData;

  const ProductDetailScreen(
      {Key? key,
      required this.data,
      required this.prodName,
      required this.serviceData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Service list'),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: serviceData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 10, right: 25, bottom: 16),
                      child: DetailWidget(
                          price: serviceData[index].amount,
                          prodName: serviceData[index].title),
                    ),
                  ],
                );
              })),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String prodName, price;

  const DetailWidget({Key? key, required this.prodName, required this.price})
      : super(key: key);

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
