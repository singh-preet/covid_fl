import 'package:flutter/material.dart';
import 'package:phone_tech_london/controllers/brand_list_controller.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class EditBrandDialog extends StatelessWidget {
  final BrandListController brandListController;
  EditBrandDialog({
    Key? key, required this.brandListController,
  }) : super(key: key){
    brandListController.initialize(brandListController.brandName.text);
  }

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
              decoration: InputDecoration(labelText: StringConstant.brand_name),
              controller: brandListController.brandName,
            ),
          ],
        ),
      ),
    );
  }
}
