import 'package:covid_fl/controllers/product_list_controller.dart';
import 'package:covid_fl/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_detail_controller.dart';
import '../utils/app_colors.dart';
import '../utils/style_manager.dart';

class ProductListWidget extends StatelessWidget {
  final ProductListController productListController = Get.find();
  final List<ProductListModel> data;
  ProductListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Brand"), ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidget(
                        name: data[index].prodName,
                        price: data[index].price,
                        serviceName: data[index].serviceName,
                      ),
                    );
                  }),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Add new Product"),
            ),
          ],
        ));
  }
}

class ProductWidget extends StatelessWidget {
  final String name;
  final String serviceName, price;
  final ProductDetailController controller = Get.put(ProductDetailController());

  ProductWidget({
    Key? key,
    required this.name,
    required this.serviceName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                    data: controller.prodDetailData, prodName: name)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightOrange,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: StyleManager.bold(color: AppColors.unselectedTab),
                ),
                IconButton(
                  onPressed: () => Get.defaultDialog(
                      title: name,
                      content: EditBrandDialog(),
                      barrierDismissible: false),
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.lightOrange,
                    size: 20,
                  ),
                )
              ],
            ),
            Text(
              serviceName,
              style: StyleManager.bold(color: AppColors.unselectedTab),
            ),
            Text(
              price,
              style: StyleManager.bold(color: AppColors.unselectedTab),
            ),
          ],
        ),
      ),
    );
  }
}

class EditBrandDialog extends StatelessWidget {
  const EditBrandDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Service Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Price"),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
