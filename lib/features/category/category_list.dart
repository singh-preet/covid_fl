import 'package:flutter/material.dart';
import 'package:covid_fl/data/models/response_model/category_response.dart';

class CategoryList extends StatelessWidget {
  final CategoryResponse? categoryResponse;
  const CategoryList({
    Key? key,
    required this.categoryResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryResponse == null
        ? Center(child: CircularProgressIndicator(),)
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
                    categoryResponse!.data[index].catName,
                  ),
                );
              }),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Add new Category")),
      ],
    );
  }
}
