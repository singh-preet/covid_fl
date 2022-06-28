import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/border_container.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class ServiceDropDown extends StatelessWidget {
   ServiceDropDown({
    Key? key,
    // required this.serviceDetailController,
     this.modelId, required this.isAddService, required this.categoryId,
  }) : super(key: key);

  final ServiceDetailController serviceDetailController = Get.find();
  final String? modelId;
  final bool isAddService;
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: DropdownButtonFormField<dynamic>(
        elevation: 5,
        isDense: true,
        items: serviceDetailController.getServiceDropDown(categoryId),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            labelText: StringConstant.select_service,
            isDense: true,
            border: InputBorder.none),
        onChanged: (_) {
          if(isAddService){
            serviceDetailController
                .addService(id: _, amount: "1", modelId: modelId!)
                .then((UpdateResponse _) {
              if (_.status == 200) {
                Get.offAllNamed(Routes.HOME);
                Get.rawSnackbar(
                    message: _.message, backgroundColor: Colors.green);
              } else {
                Get.rawSnackbar(
                    message: _.message, backgroundColor: Colors.red);
              }
            });
          }

        },
      ),
    );
  }
}
