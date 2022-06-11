import 'package:flutter/material.dart';
import 'package:phone_tech_london/utils/string_constant.dart';

class AddTabDialog extends StatelessWidget {
  AddTabDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tabName = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: StringConstant.tablet_name),
            controller: tabName,
          ),
          ElevatedButton(onPressed: (){}, child: Text(StringConstant.add))
        ],
      ),
    );
  }
}
