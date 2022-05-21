import 'package:phone_tech_london/controllers/model_list_controller.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/features/models/model_list_widget.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_brand_dialog.dart';

class BrandTile extends StatelessWidget {
  final ProductListController controller = Get.put(ProductListController());
  final String brandName, remarks, brandId;
  BrandTile({
    Key? key,
    required this.brandName,
    required this.remarks,
    required this.brandId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ModelsResponse data = await controller.getModels(brandId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ModelList(
                      data: data,
                      brandName: brandName,
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
                  brandName,
                  style: StyleManager.bold(color: AppColors.unselectedTab),
                ),
                IconButton(
                  onPressed: () => Get.defaultDialog(
                      title: brandName,
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Update")),
                      ],
                      content: EditBrandDialog(),
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