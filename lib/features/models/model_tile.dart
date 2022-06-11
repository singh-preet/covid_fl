import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/features/_widgets/border_container.dart';
import 'package:phone_tech_london/features/models/edit_model_dialog.dart';
import 'package:flutter/material.dart';
import 'package:phone_tech_london/features/service/service_detail_screen.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/style_manager.dart';

class ModelTile extends StatelessWidget {
  final String name, id;
  final List<ServiceList> serviceData;
  final ServiceDetailController controller = Get.find();
  // final ServiceDetailController controller = Get.put(ServiceDetailController());

  ModelTile({
    Key? key,
    required this.name,
    required this.serviceData,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServiceDetailScreen(
                      modelId: id,
                      prodName: name,
                      serviceData: serviceData,
                    )));
      },
      child: BorderContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: StyleManager.bold(color: AppColors.unselectedTab),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.defaultDialog(
                  title: name,
                  content: EditModelDialog(),
                  barrierDismissible: false),
              icon: Icon(
                Icons.edit,
                color: AppColors.lightOrange,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
