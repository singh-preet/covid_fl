import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/features/_widgets/service_dropdown.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class GenerateInvoice extends StatelessWidget {
  GenerateInvoice({Key? key}) : super(key: key);
  final ServiceDetailController serviceDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            ServiceDropDown(
              serviceDetailController: serviceDetailController,
              isAddService: false,
              categoryId: 1,
            )
          ],
        ),
        Column(
          children: [
            CustomTextField(
                controller: TextEditingController(),
                labelText: StringConstant.f_name,
                keyboardType: TextInputType.emailAddress),
            CustomTextField(
                controller: TextEditingController(),
                labelText: StringConstant.l_name,
                keyboardType: TextInputType.phone),
            CustomTextField(
                controller: TextEditingController(),
                labelText: StringConstant.email,
                suffixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress),
            CustomTextField(
                controller: TextEditingController(),
                labelText: StringConstant.phone,
                suffixIcon: Icons.call,
                keyboardType: TextInputType.phone),
          ],
        )
      ],
    );
  }
}
