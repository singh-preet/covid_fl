import 'package:flutter/cupertino.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/border_container.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/features/brand_phones/brand_list_widget.dart';
import 'package:phone_tech_london/features/laptop/laptop_grid.dart';
import 'package:phone_tech_london/features/orders/orders.dart';
import 'package:phone_tech_london/features/tablet/tablet_grid.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/app_images.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/utils/categories.dart';

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
              AddCoupon(homeController: controller),
              Orders(data: controller.orders),
            ],
          ),
        ),
      );
    });
  }
}

class AddCoupon extends StatelessWidget {
  final HomeController homeController;
  const AddCoupon({Key? key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Please select a category"),
          Container(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: ()=>homeController.updateCategory(Categories.values[index]),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: homeController.category ==
                                      Categories.values[index]
                                  ? AppColors.lightOrange
                                  : AppColors.greyColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(Categories.values[index].name)),
                    )),
          ),
          CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'Coupon',
            controller: homeController.coupon,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'Greater Than',
                  controller: homeController.greaterThan,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'Value',
                  controller: homeController.value,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: () async {
              UpdateResponse res= await homeController.addCoupon();
                Get.rawSnackbar(message: res.message, backgroundColor: res.status==200?Colors.green:Colors.red);
            },
            color: AppColors.lightOrange,
            child: Text("Add Order"),
          )
        ],
      ),
    );
  }
}
