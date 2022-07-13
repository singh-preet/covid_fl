import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:phone_tech_london/features/coupon/add_coupon.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
import 'package:phone_tech_london/utils/style_manager.dart';

class CouponList extends StatelessWidget {
  final HomeController homeController;
  const CouponList({Key? key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total : $count"),
            IconButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: AddCoupon(
                      homeController: homeController,
                    ),
                  ));
                },
                icon: Icon(
                  Icons.add_circle,
                  color: AppColors.lightOrange,
                ))
          ],
        ),
        Row(children: [
          CircleAvatar(backgroundColor: Colors.red,maxRadius: 6),
          Text(" Flat"),
          SizedBox(width: 10,),
          CircleAvatar(backgroundColor: Colors.lightGreenAccent,maxRadius: 6),
          Text(" Percentage"),
        ]),
        Expanded(
          child: count == 0
              ? Center(
                  child: Text("No Coupons Added"),
                )
              : ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.red, width: 5) ),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.5),
                                blurRadius: 0.8,
                                spreadRadius: 0.5,
                                offset: Offset(1.5, 1.5)),
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.2),
                                blurRadius: 0.3,
                                spreadRadius: 0.2,
                                offset: Offset(-0.5, -0.5))
                          ]),
                      child: ListTile(
                        title: Text("FLAT200",
                            style: StyleManager.bold(
                                color: AppColors.unselectedTab)),
                        trailing: Column(
                          children: [
                            Text(
                              "28-8-2012",
                              style: StyleManager.regularBlack(
                                  color: AppColors.unselectedTab, fontSize: 12),
                            ),
                            Expanded(
                              child: Transform.scale(
                                  scale: 0.9,
                                  child: Chip(
                                    shape: StadiumBorder(
                                        side: BorderSide(color: AppColors.lightOrange)),
                                    label: Text("VALUE : 20",style: StyleManager.boldWhite(fontSize: 12)),backgroundColor: AppColors.lightOrange.withOpacity(0.6),)),
                            )
                          ],
                        ),
                        subtitle: Text(
                          "Greater than 50",
                          style: StyleManager.regularBlack(
                              color: AppColors.lightOrange,fontSize: 12),
                        ),
                      ),
                    );
                  }),
        )
      ],
    );
  }
}
