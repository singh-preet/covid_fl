import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/features/brand_phones/brand_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandListView extends StatelessWidget {
  final BrandResponse? data;
  const BrandListView({
    Key? key,
    required this.data,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BrandTile(
                          brandName: data!.data[index].brandName,
                          remarks: data!.data[index].brandUrl,
                          brandId: data!.data[index].id,
                        ),
                      );
                    }),
              ),
              ElevatedButton(onPressed: () {}, child: Text("New Brand")),
            ],
    );
  }
}
