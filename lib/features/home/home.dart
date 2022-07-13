import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/features/brand_phones/brand_list_widget.dart';
import 'package:phone_tech_london/features/coupon/add_coupon.dart';
import 'package:phone_tech_london/features/laptop/laptop_grid.dart';
import 'package:phone_tech_london/features/orders/orders.dart';
import 'package:phone_tech_london/features/tablet/tablet_grid.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/app_images.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  final HomeController controller = Get.find();
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(initState: (_) {
      controller.getHomePageData(getLaptop: true, getOrder: true, getPhone: true, getTab: true);
    }, builder: (controller) {
      return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
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
                Text(StringConstant.APP_NAME,
                    style: TextStyle(
                        color: AppColors.lightOrange, letterSpacing: 2)),
                Text(StringConstant.USERNAME,
                    style: TextStyle(
                        color: AppColors.unselectedTab, fontSize: 12)),
              ],
            ),
            backgroundColor: AppColors.white,
            bottom: TabBar(
              isScrollable: true,
              labelColor: AppColors.lightOrange,
              tabs: controller.tabs,
              indicatorColor: AppColors.lightOrange,
              unselectedLabelColor: AppColors.lightOrange.withOpacity(0.8),
            ),
          ),
          body: TabBarView(
            children: [
              BrandListView(data: controller.brands),
              TabList(tabResponse: controller.tablets),
              LaptopList(categoryResponse: controller.laptop),
              // CouponList(homeController: controller),
              AddCoupon(homeController: controller),
              Orders(data: controller.orders),
            ],
          ),
        ),
      );
    });
  }
}

