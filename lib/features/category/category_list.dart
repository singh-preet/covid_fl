import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final BrandResponse? categoryResponse;
  const CategoryList({
    Key? key,
    required this.categoryResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryResponse == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryResponse?.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categoryResponse!.data[index].brandName,
                        ),
                      );
                    }),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Add Laptop")),
            ],
          );
  }
}
