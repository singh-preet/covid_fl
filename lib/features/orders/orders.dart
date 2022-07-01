import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:phone_tech_london/features/orders/orderTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/app_colors.dart';

class Orders extends StatelessWidget {
  final OrdersResponse? data;
    Orders({Key? key, required this.data}) : super(key: key);
  GenerateInvoiceController invoiceController= Get.find();
  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.data.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return OrderTile(data: data!.data[index], controller:invoiceController);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Generate Invoice:"),
                    MaterialButton(
                      onPressed: () =>Get.toNamed(Routes.GENERATE_ORDER),
                      child: Text(
                        "Add Order",
                      ),
                      color: AppColors.lightOrange,
                    )
                  ],
                ),
              )
            ],
          );
  }
}
