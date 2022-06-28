import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/add_order_id_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/service_dropdown.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/categories.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

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
      body: GetBuilder<GenerateInvoiceController>(builder: (controller) {
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
                controller.orderId != null
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
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold)),
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
                    UpdateResponse data =
                    await controller.addServiceToOrderId();
                    Get.rawSnackbar(message: data.message);
                  },
                  color: AppColors.lightOrange,
                  child: Text("Add Service to Order"),
                ),

              ],
            ),
            MaterialButton(
              onPressed: () {
                controller.addOrderId();
              },
              color: AppColors.lightOrange,
              child: Text("Generate Invoice"),
            )
          ],
        );
      }),
    );
  }
}

//              Stepper(
//                   currentStep: controller.currentStep.value,
//                   onStepCancel: controller.onStepCancel(),
//                   onStepContinue: controller.onStepContinue(),
//                   onStepTapped: (step) => controller.stepTapped(step),
//                   steps: [
//                     Step(
//                       title: new Text('Generate Order Id'),
//                       content:
//                           // controller.orderId == null ? InkWell(
//                           //   onTap: () {
//                           //     Clipboard.setData(
//                           //         ClipboardData(text: controller.orderId));
//                           //     Get.rawSnackbar(
//                           //       // maxWidth: SizeConfig.safeBlockHorizontal * 60,
//                           //       message: StringConstant.phoneCopy,
//                           //       icon: const Icon(
//                           //         Icons.check,
//                           //         color: Colors.lightGreenAccent,
//                           //       ),
//                           //       // margin: EdgeInsets.symmetric(
//                           //       //     horizontal: SizeConfig.safeBlockVertical * 4,
//                           //       //     vertical: SizeConfig.safeBlockVertical * 1.25),
//                           //       borderRadius: 30,
//                           //     );
//                           //   },
//                           //   child: Container(
//                           //       width: double.maxFinite,
//                           //       color: Colors.grey,
//                           //       padding: EdgeInsets.all(8),
//                           //       margin: EdgeInsets.all(8),
//                           //       child: Row(
//                           //         children: [
//                           //           Text("controller.orderId!"),
//                           //         ],
//                           //       )),
//                           // ) :
//                           Column(
//                         children: [
//                           CustomTextField(
//                               controller: controller.fNameController,
//                               labelText: StringConstant.f_name,
//                               keyboardType: TextInputType.emailAddress),
//                           CustomTextField(
//                               controller: controller.lNameController,
//                               labelText: StringConstant.l_name,
//                               keyboardType: TextInputType.phone),
//                           CustomTextField(
//                               controller: controller.emailController,
//                               labelText: StringConstant.email,
//                               suffixIcon: Icons.email_outlined,
//                               keyboardType: TextInputType.emailAddress),
//                           CustomTextField(
//                               controller: controller.phoneController,
//                               labelText: StringConstant.phone,
//                               suffixIcon: Icons.call,
//                               keyboardType: TextInputType.phone),
//                           CustomTextField(
//                               controller: controller.modelNameController,
//                               labelText: StringConstant.model_name,
//                               keyboardType: TextInputType.emailAddress),
//                           MaterialButton(
//                             onPressed: () async {
//                               AddOrderIdResponse data =
//                                   await controller.addOrderId();
//                               Get.rawSnackbar(message: data.message);
//                             },
//                             color: AppColors.lightOrange,
//                             child: Text("Get Order Id"),
//                           )
//                         ],
//                       ),
//                       isActive: controller.currentStep.value == 0,
//                       state: controller.currentStep.value == 0
//                           ? StepState.editing
//                           : StepState.complete,
//                     ),
//                     Step(
//                         title: new Text('Add Service to Order'),
//                         content: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Please select a category"),
//                             Container(
//                               height: 60,
//                               child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: Categories.values.length,
//                                   itemBuilder: (context, index) => GestureDetector(
//                                         onTap: () => controller.updateCategory(
//                                             Categories.values[index].name),
//                                         child: Container(
//                                             padding:
//                                                 EdgeInsets.symmetric(horizontal: 8),
//                                             margin: EdgeInsets.all(8),
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                                 color: controller.category ==
//                                                         Categories
//                                                             .values[index].name
//                                                     ? AppColors.lightOrange
//                                                     : AppColors.greyColor,
//                                                 borderRadius:
//                                                     BorderRadius.circular(8)),
//                                             child: Text(
//                                                 Categories.values[index].name)),
//                                       )),
//                             ),
//                             ServiceDropDown(
//                               serviceDetailController: serviceDetailController,
//                               isAddService: false,
//                               categoryId: "1",
//                             )
//                           ],
//                         ),
//                         isActive: controller.currentStep.value == 1,
//                         state:
//                             // controller.currentStep.value == 1 ?
//                             StepState.editing
//                         // : controller.currentStep.value < 1 ? StepState.disabled: StepState.complete,
//                         ),
//                     Step(
//                       title: new Text("Fetch Order Details"),
//                       content: Column(
//                         children: <Widget>[
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'Account No'),
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'IFSC Code'),
//                           ),
//                         ],
//                       ),
//                       isActive: controller.currentStep.value == 2,
//                       state: controller.currentStep.value == 2
//                           ? StepState.editing
//                           : StepState.complete,
//                     ),
//                     Step(
//                       title: new Text('Delete Service from Order'),
//                       content: Column(
//                         children: <Widget>[
//                           Text("${controller.currentStep.value >= 0}"),
//                           Text("${controller.currentStep.value == 0}"),
//                         ],
//                       ),
//                       isActive: controller.currentStep.value == 3,
//                       state: controller.currentStep.value == 3
//                           ? StepState.editing
//                           : StepState.complete,
//                     ),
//                     Step(
//                       title: new Text('Send Invoice'),
//                       content: Column(
//                         children: <Widget>[
//                           Text("${controller.currentStep.value >= 0}"),
//                           Text("${controller.currentStep.value == 0}"),
//                         ],
//                       ),
//                       isActive: controller.currentStep.value == 4,
//                       state: controller.currentStep.value == 4
//                           ? StepState.editing
//                           : StepState.complete,
//                     ),
//                   ]),

// class OrderId extends StatelessWidget {
//   const OrderId({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class AddServiceForOrder extends StatelessWidget {
  const AddServiceForOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
