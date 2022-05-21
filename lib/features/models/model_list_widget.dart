import 'package:covid_fl/controllers/model_list_controller.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/features/models/model_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ModelList extends StatelessWidget {
  final ProductListController productListController = Get.find();
  final ModelsResponse data;
  final String brandName;
  ModelList({Key? key, required this.data, required this.brandName})
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ModelTile(
                        name: data.data[index].modelName,
                        serviceData: data.data[index].serviceList,
                      ),
                    );
                  }),
            ),
            TextButton(
              onPressed: () {
                productListController.addModel(brandId: "", modelName: "");
              },
              child: Text("Add new Product"),
            ),
          ],
        ));
  }
}


