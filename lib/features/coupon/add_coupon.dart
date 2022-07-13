import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/categories.dart';

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
                              : AppColors.grey,
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
