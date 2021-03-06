import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class OrderTile extends StatelessWidget {
  final GenerateInvoiceController controller;
  OrderTile({Key? key, required this.data, required this.controller})
      : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.orderId),
                          IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => Get.back())
                        ],
                      ),
                      content: Container(
                        width: 250,
                        height: 250,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: data.services.length,
                                  itemBuilder: (context, index) => Chip(
                                        backgroundColor: AppColors.lightOrange,
                                        label: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(data.services[index].title),
                                            Text(
                                                "  -  ${StringConstant.GBP}${data.services[index].amount}",
                                                textAlign: TextAlign.right),
                                          ],
                                        ),
                                      )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Total :  ${StringConstant.GBP}${data.totalAmount}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                MaterialButton(
                                  color: AppColors.lightOrange,
                                  onPressed: () async {
                                    UpdateResponse res= await controller.sendInvoice(data.orderId);
                                    if(res.status==200){
                                      Get.back();
                                      Get.rawSnackbar(message: "Invoice Sent Successfully");
                                    }else{
                                      Get.rawSnackbar(message: res.message);
                                    }
                                  }
                                      ,
                                  child: Text("Send Invoice"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          },
          leading: Image.network(
              "https://ebillplus.com/phonetech/public/assets/web/img/brands/google.png"),
          title: Text(data.userName),
          subtitle: Text(data.userEmail),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  UrlLauncher.launch("tel://" + data.userMobile);
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  print(data.orderId);
                  Get.bottomSheet(Container(
                    height: 250,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Add Service for ${data.userName}",
                              style: StyleManager.bold()),
                        ),
                        CustomTextField(
                            controller: controller.serviceController,
                            labelText: StringConstant.service_name,
                            keyboardType: TextInputType.text),
                        CustomTextField(
                            controller: controller.amountController,
                            labelText: StringConstant.amount,
                            keyboardType: TextInputType.number),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  controller.orderId=data.orderId;
                                  UpdateResponse res =
                                      await controller.addServiceToOrderId();
                                  Get.rawSnackbar(message: res.message);
                                  if (res.status == 200) {
                                    HomeController homeController = Get.find();
                                    homeController.getHomePageData(
                                        getOrder: true);
                                    controller.serviceController.clear();
                                    controller.amountController.clear();
                                  }
                                },
                                color: AppColors.lightOrange,
                                child: Text("Add Service to Order"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
                },
                icon: Icon(
                  Icons.receipt_long,
                  color: AppColors.lightOrange,
                ),
              ),
            ],
          ),
        ));
  }
}
