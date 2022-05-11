import 'package:flutter/material.dart';

class OrderModel {
  OrderModel(
      {@required this.customerName,
        @required this.deviceName,
        @required this.services,
        @required this.amount,
        @required this.email,
        @required this.phone});
  final List<String> services;
  final String customerName, deviceName, amount, email, phone;
}