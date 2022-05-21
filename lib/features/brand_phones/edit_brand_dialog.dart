import 'package:flutter/material.dart';

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
              decoration: InputDecoration(labelText: "Brand Name"),
            ),
          ],
        ),
      ),
    );
  }
}
