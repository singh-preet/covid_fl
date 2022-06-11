import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/features/tablet/add_tab_dialog.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:phone_tech_london/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabList extends StatelessWidget {
  final BrandResponse? tabResponse;
  const TabList({
    Key? key,
    required this.tabResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tabResponse == null
        ? Center(
      child: CupertinoActivityIndicator(),
    )
        : Column(
      children: [
        Expanded(
          child:
          GridView.builder(
            shrinkWrap: true,
            itemCount: tabResponse?.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Image.network(
                            tabResponse!.data[index].brandImage),
                      ),
                      Text(
                        tabResponse!.data[index].brandName,
                        style: StyleManager.bold(),
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          ),
        ),
        ElevatedButton(
            onPressed: () => Get.defaultDialog(
                title: StringConstant.new_tablet,
                content: AddTabDialog()),
            child: Text(StringConstant.add_laptop)),
      ],
    );
  }
}
