import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  final BrandResponse? categoryResponse;
  const CategoryList({
    Key? key,
    required this.categoryResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryResponse == null
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: categoryResponse?.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(categoryResponse!.data[index].brandImage),
                            Text(
                              categoryResponse!.data[index].brandName,
                              style: StyleManager.bold(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
              ElevatedButton(onPressed: ()=>Get.toNamed(Routes.ADD_LAPTOP), child: Text("Add Laptop")),
            ],
          );
  }
}
