import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaptopList extends StatelessWidget {
  final BrandResponse? categoryResponse;
  const LaptopList({
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
                            Image.network(
                                categoryResponse!.data[index].brandImage),
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
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.ADD_LAPTOP),
                  child: Text(StringConstant.add_laptop)),
            ],
          );
  }
}
