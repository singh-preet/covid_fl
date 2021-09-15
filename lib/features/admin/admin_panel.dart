import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('formattedDate',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('companyName',
                style: TextStyle(
                    color: Colors.orange[400],
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.refresh_thick,
                                size: 45,
                                color: Colors.teal
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Switch",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
