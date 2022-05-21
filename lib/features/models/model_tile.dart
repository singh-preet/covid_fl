import 'package:covid_fl/controllers/service_detail_controller.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/features/models/edit_model_dialog.dart';
import 'package:flutter/material.dart';
import 'package:covid_fl/features/service/service_detail_screen.dart';
import 'package:get/get.dart';
import '../../controllers/service_detail_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/style_manager.dart';

class ModelTile extends StatelessWidget {
  final String name;
  final List<ServiceList> serviceData;
  final ServiceDetailController controller = Get.put(ServiceDetailController());

  ModelTile({
    Key? key,
    required this.name,
    required this.serviceData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServiceDetailScreen(
                  prodName: name,
                  serviceData: serviceData,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightOrange,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: StyleManager.bold(color: AppColors.unselectedTab),
                ),
                IconButton(
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
          ],
        ),
      ),
    );
  }
}
