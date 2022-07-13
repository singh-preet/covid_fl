import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/add_order_id_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';

class GenerateInvoice extends StatelessWidget {
  GenerateInvoice({Key? key}) : super(key: key);
  final ServiceDetailController serviceDetailController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Generate Order Id"),
      ),
      body: GetBuilder<GenerateInvoiceController>(
          autoRemove: true,
          builder: (controller) {
        return Column(
          children: [
            Column(
              children: [
                CustomTextField(
                    controller: controller.fNameController,
                    labelText: StringConstant.f_name,
                    keyboardType: TextInputType.text),
                CustomTextField(
                    controller: controller.lNameController,
                    labelText: StringConstant.l_name,
                    keyboardType: TextInputType.text),
                CustomTextField(
                    controller: controller.emailController,
                    labelText: StringConstant.email,
                    suffixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress),
                CustomTextField(
                    controller: controller.phoneController,
                    labelText: StringConstant.phone,
                    suffixIcon: Icons.call,
                    keyboardType: TextInputType.phone),
                CustomTextField(
                    controller: controller.modelNameController,
                    labelText: StringConstant.model_name,
                    keyboardType: TextInputType.text),
                controller.orderId != null && controller.orderId!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            width: double.maxFinite,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.lightGreen),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order Id",
                                      style: StyleManager.bold()),
                                  Text(
                                    controller.orderId!,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      )
                    : MaterialButton(
                  onPressed: () async {
                    AddOrderIdResponse data =
                    await controller.addOrderId();
                    Get.rawSnackbar(message: data.message);
                  },
                  color: AppColors.lightOrange,
                  child: Text("Get Order Id"),
                ),
                CustomTextField(
                    controller: controller.serviceController,
                    labelText: StringConstant.service_name,
                    keyboardType: TextInputType.text),
                CustomTextField(
                    controller: controller.amountController,
                    labelText: StringConstant.amount,
                    keyboardType: TextInputType.number),
                MaterialButton(
                  onPressed: () async {
                    UpdateResponse data = await controller.addServiceToOrderId();
                    Get.rawSnackbar(message: data.message);
                    if(data.status==200){
                      HomeController homeController=Get.find();
                      homeController.getHomePageData(getOrder: true);
                      controller.serviceController.clear();
                      controller.amountController.clear();
                    }
                  },
                  color: AppColors.lightOrange,
                  child: Text("Add Service to Order"),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
