import 'package:covid_fl/utils/string_constant.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
        title: Text(StringConstant.SELECT_OPTION),
        actions: [
          CupertinoActionSheetAction(
            child: Text(StringConstant.ABSENT),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text(StringConstant.CHECKOUT, style: StyleManager.greenBold),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text(StringConstant.REACHING_CHECKPOINT,
                style: StyleManager.greenBold),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text(StringConstant.LEAVING_CHECKPOINT,
                style: StyleManager.greenBold),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text(
              StringConstant.AT_OFFICE,
            ),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text(StringConstant.CHECK_IN, style: StyleManager.greenBold),
            onPressed: () {},
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(StringConstant.CANCEL),
          onPressed: () {
            Get.back();
          },
        ));
  }
}
