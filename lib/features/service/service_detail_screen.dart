import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/service_dropdown.dart';
import 'package:phone_tech_london/features/service/service_tile.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String prodName, modelId;
  final List<ServiceList> serviceData;
  final ServiceDetailController serviceDetailController = Get.find();

  ServiceDetailScreen(
      {Key? key,
      required this.prodName,
      required this.serviceData,
      required this.modelId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prodName),
      ),
      body: Column(
        children: [
          ServiceDropDown(
              // serviceDetailController: serviceDetailController,
              modelId: modelId,
              isAddService: true,
              categoryId: "1"),
          Expanded(
            child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: serviceData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          serviceDetailController
                              .initialize(serviceData[index].amount);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(serviceData[index].title),
                                        IconButton(
                                            onPressed: () {
                                              serviceDetailController.clear();
                                              Get.back();
                                            },
                                            icon: Icon(Icons.clear))
                                      ],
                                    ),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () async {
                                          serviceDetailController
                                              .updateService(
                                                  serviceData[index].sId,
                                                  serviceDetailController
                                                      .charges.text)
                                              .then((UpdateResponse value) {
                                            if (value.status == 200 &&
                                                value.message == "Success") {
                                              Get.rawSnackbar(
                                                  message: value.message);
                                            } else {
                                              Get.rawSnackbar(
                                                  message:
                                                      StringConstant.try_again,
                                                  backgroundColor: Colors.red);
                                            }
                                          });
                                          Get.offAllNamed(Routes.HOME);
                                        },
                                        child: Text(StringConstant.update),
                                        color: AppColors.lightOrange,
                                      )
                                    ],
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Service charge"),
                                        TextFormField(
                                            controller:
                                                serviceDetailController.charges,
                                            decoration: InputDecoration(
                                                prefix: Text(
                                                    "${StringConstant.GBP}"))),
                                      ],
                                    ),
                                  ));
                        },
                        child: ServiceTile(
                            price: serviceData[index].amount,
                            service: serviceData[index].title),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
