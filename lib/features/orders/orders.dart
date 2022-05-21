import 'package:covid_fl/data/models/response_model/order_response.dart';
import 'package:covid_fl/features/orders/orderTile.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final OrdersResponse? data;
  const Orders({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data!.data.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return
                  OrderTile(data: data!.data[index]);
              }),
        ),
      ],
    );
  }
}
