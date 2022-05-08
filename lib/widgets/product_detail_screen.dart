import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/style_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ),
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Galaxy S9',
          style: StyleManager.regularBlack(fontSize: 16),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child:
              Transform.scale(scale: 1.5, child: Image.asset(AppImages.logo)),
        ),
        Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              'Choose services from the list',
              style: StyleManager.boldBlack(),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Wrap(children: [
                  CheckboxListTile(
                    activeColor: AppColors.lightOrange,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Broken LCD'),
                    value: _checked,
                    onChanged: (value) {
                      setState(() {
                        _checked = !_checked;
                      });
                    },
                  ),
                ]);
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstant.SUBTOTAL,
                style: StyleManager.boldBlack(fontSize: 18),
              ),
              MaterialButton(
                onPressed: () {},
                height: 40,
                child: Text(
                  "NaN",
                  style: StyleManager.regularBlack(),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: AppColors.greyColor,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {},
                height: 40,
                child: Text(
                  StringConstant.PROCEED_TO_PAY,
                  style: StyleManager.regularWhite(),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: AppColors.lightOrange,
              )
            ],
          ),
        )
      ],
    );
  }
}
