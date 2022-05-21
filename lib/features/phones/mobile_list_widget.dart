import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:covid_fl/features/models/model_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/model_list_controller.dart';
import '../../utils/app_colors.dart';

class BrandListView extends StatelessWidget {
  final BrandResponse? data;
  const BrandListView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BrandListWidget(
                          brandName: data!.data[index].brandName,
                          remarks: data!.data[index].brandUrl,
                          brandId: data!.data[index].id,
                        ),
                      );
                    }),
              ),
              ElevatedButton(onPressed: () {}, child: Text("New Brand")),
            ],
          );
  }
}

class BrandListWidget extends StatelessWidget {
  final ProductListController controller = Get.put(ProductListController());
  final String brandName, remarks, brandId;
  BrandListWidget({
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

class EditBrandDialog extends StatelessWidget {
  const EditBrandDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Brand Name"),
            ),
          ],
        ),
      ),
    );
  }
}
