import 'package:covid_fl/controllers/admin_panel_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: new Text(StringConstant.ADMIN_PANEL),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: GetBuilder<AdminPanelController>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('formattedDate',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text('companyName',
                    style:
                    TextStyle(
                        color: AppColors.lightOrange,
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              try{
                                controller.items[index].onTap();
                              }catch(e){
                                print(e);
                              }
                            },
                            child: Card(
                              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                        controller.items[index].icon,
                                      size: 45,
                                      color: Colors.teal
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      controller.items[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
