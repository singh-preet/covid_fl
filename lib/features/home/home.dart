import 'package:covid_fl/controllers/home_controller.dart';
import 'package:covid_fl/features/orders/orders.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/app_images.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/brand_list_widget.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 8.0, right: 0.0, bottom: 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImages.logo),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstant.USERNAME,
                  style:
                      TextStyle(color: AppColors.lightOrange, letterSpacing: 2),
                ),
                Text(
                  StringConstant.APP_NAME,
                  style:
                      TextStyle(color: AppColors.unselectedTab, fontSize: 12),
                ),
              ],
            ),
            backgroundColor: AppColors.white,
            bottom: TabBar(
              labelColor: AppColors.lightOrange,
              tabs: [
                Tab(
                  child: Text("Brands"),
                ),
                Tab(
                  child: Text("Models"),
                ),
                Tab(
                  icon: Text("Orders"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BrandListView(data: controller.brandData),
              Container(
                color: Colors.white,
                height: 500,
                width: 400,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Waheguru"),
                  ],
                ),
              ),
              Orders(data: controller.orderData),
            ],
          ),
        ),
      );
    });
  }
}



