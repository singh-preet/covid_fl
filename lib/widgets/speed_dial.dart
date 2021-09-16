import 'package:covid_fl/data/models/speed_dial_details_model.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<SpeedDialDetailsModel> speedDial = [
  new SpeedDialDetailsModel(StringConstant.CHECKOUT_EMPLOYEE, Icons.flight_takeoff, Routes.STAFF_STATUS),
  new SpeedDialDetailsModel(StringConstant.MARK_ABSENT, Icons.cancel,
      Routes.LEADERBOARD),
  new SpeedDialDetailsModel(StringConstant.RESET_CHECKOUT, Icons.flight_takeoff,
      Routes.POST_ANNOUNCEMENT),
  new SpeedDialDetailsModel(
      StringConstant.RESET_CHECK_IN, Icons.flight_land, Routes.ADMIN_PANEL),
];

final TextStyle customStyle =
TextStyle(inherit: false, color: Colors.black, fontSize: 12);

class SpeedDialFAB extends StatelessWidget {
  const SpeedDialFAB({
    Key key,
    @required this.speedDial,
    @required this.customStyle,
  }) : super(key: key);

  final List<SpeedDialDetailsModel> speedDial;
  final TextStyle customStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.0,
      width: 68.0,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            // SizeConfig().init(context);
            Get.dialog(Scaffold(
              floatingActionButton: Container(
                height: 68.0,
                width: 68.0,
                child: FittedBox(
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () => Get.back()),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.52,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: speedDial.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print(speedDial[index].navigateTo);
                                      Get.back();
                                      Get.toNamed(speedDial[index].navigateTo);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin:
                                          const EdgeInsets.only(right: 5.0),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          child: Text(speedDial[index].value,
                                              style: customStyle),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            speedDial[index].imgURL,
                                          ),
                                        ),
                                        SizedBox(width: 20,)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
