import 'package:phone_tech_london/controllers/brand_list_controller.dart';
import 'package:phone_tech_london/controllers/model_list_controller.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/border_container.dart';
import 'package:phone_tech_london/features/models/model_list_widget.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'edit_brand_dialog.dart';

class BrandTile extends StatelessWidget {
  final BrandListController brandListController = Get.find();
  final ProductListController controller = Get.put(ProductListController());

  final String brandName, remarks, brandId;
  BrandTile(
      {Key? key,
      required this.brandName,
      required this.remarks,
      required this.brandId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ModelsResponse data = await controller.getModels(brandId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ModelList(
                    data: data, brandName: brandName, brandId: brandId)));
      },

      child: BorderContainer(
        child: Row(
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
                        onPressed: () async {
                          brandListController
                              .editBrand(brandName: brandListController.brandName.text,
                                  brandId: brandId)
                              .then((UpdateResponse value) {
                            if (value.status == 200 &&
                                value.message == "Success") {
                              Get.rawSnackbar(message: value.message);
                            } else {
                              Get.rawSnackbar(
                                  message: StringConstant.try_again,
                                  backgroundColor: Colors.red);
                            }
                          });
                          Get.offAllNamed(Routes.HOME);
                        },
                        child: Text(StringConstant.update)),
                  ],
                  content: EditBrandDialog(
                      brandListController: brandListController),
                  barrierDismissible: false),
              icon: Icon(
                Icons.edit,
                color: AppColors.lightOrange,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
