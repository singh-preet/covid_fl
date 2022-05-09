import 'package:covid_fl/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/style_manager.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return BrandListWidget();
              }),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Add new Brand")),
      ],
    );
  }
}

class BrandListWidget extends StatelessWidget {
  const BrandListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductListWidget()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightOrange,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Samsung",
                ),
                Icon(
                  Icons.edit,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
