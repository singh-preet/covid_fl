import 'package:covid_fl/controllers/home_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
              items: controller.items,
              selectedItemColor: AppColors.selectedTab,
              unselectedItemColor: AppColors.unselectedTab,
              currentIndex: controller.selectedTabIndex,
              onTap: (int index)=>controller.onTabChanged(index, context)),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Keep ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Connected",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        child: Text(
                            "Karo India Foundation Initiative",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                letterSpacing: 2,
                                fontWeight:
                                FontWeight.bold))),
                    SizedBox(
                      height: 5,
                    ),
                    Chip(
                      backgroundColor: Colors.transparent,
                      avatar: CircleAvatar(
                          radius: 50,
                      ),

                      label: Text("cName"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                            child: Text("Hello " + "Waheguru",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 0,
                                    fontWeight:
                                    FontWeight.bold))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                          child: Text("It's " + "date",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 17,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                          child: Text("time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
              child: Divider(
                color: Colors.teal.shade100,
              ),
              width: double.infinity,
            ),

          ],
        ),
      ),);
    });
  }
}
