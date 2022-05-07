import 'package:covid_fl/controllers/home_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/app_images.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.logo),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstant.USERNAME,
                  style: TextStyle(color: AppColors.lightOrange, letterSpacing: 2),
                ),
                Text(
                  StringConstant.APP_NAME,
                  style: TextStyle(color: AppColors.unselectedTab,fontSize: 12),
                ),
              ],
            ),
            backgroundColor: AppColors.white,
            bottom:  TabBar(
              labelColor: AppColors.lightOrange,
              tabs: [
                Tab(child: Text("Brands"),),
                Tab(child: Text("Models"),),
                Tab(icon: Text("Models"),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                return Card();
              }),
              ),
              Container(color: Colors.white,),
              Container(color: Colors.white,)
            ],
          ),
        ),
      );
    });
  }
}
