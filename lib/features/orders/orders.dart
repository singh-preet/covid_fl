import 'package:covid_fl/data/models/order_model.dart';
import 'package:covid_fl/features/orders/orderTile.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final List<OrderModel> data;
  const Orders({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return
                  OrderTile(data: data[index]);
              }),
        ),
      ],
    );
  }
}
