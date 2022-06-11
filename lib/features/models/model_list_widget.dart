import 'package:phone_tech_london/controllers/model_list_controller.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/features/_widgets/common_dialog.dart';
import 'package:phone_tech_london/features/models/model_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class ModelList extends StatelessWidget {
  final ProductListController productListController = Get.find();
  final ModelsResponse data;
  final String brandName, brandId;
  ModelList(
      {Key? key,
      required this.data,
      required this.brandName,
      required this.brandId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(brandName),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: data.data.length,
                  itemBuilder: (context, index) {
                    return ModelTile(
                      id: data.data[index].id,
                      name: data.data[index].modelName,
                      serviceData: data.data[index].serviceList,
                    );
                  }),
            ),
            MaterialButton(
              color: AppColors.lightOrange,
              onPressed: () {
                productListController.initialize();
                CommonDialog.dialog(
                    controller: productListController,
                    context: context,
                    textController: productListController.newModelName,
                    title: StringConstant.add_model,
                    actionText: StringConstant.add,
                    onTap: () {
                      productListController
                          .addModel(
                              brandId: brandId,
                              modelName:
                                  productListController.newModelName.text)
                          .then((value) {
                        Get.rawSnackbar(
                            message: value.message,
                            backgroundColor: value.status == 200
                                ? Colors.green
                                : Colors.red);
                      });
                    });
              },
              child: Text(StringConstant.add_new_product),
            ),
          ],
        ));
  }
}
