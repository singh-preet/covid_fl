import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditModelDialog extends StatelessWidget {
  const EditModelDialog({
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
