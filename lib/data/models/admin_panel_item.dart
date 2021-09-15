import 'package:flutter/cupertino.dart';

class AdminPanelItemModel{
  String name;
  IconData icon;
  Function onTap;
  AdminPanelItemModel(this.name, this.icon, this.onTap);
}