import 'package:covid_fl/data/models/brand_model.dart';
import 'package:covid_fl/data/models/order_model.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  List<BrandModel> brandData = [
    BrandModel(name: "Samsung", remarks: "some remarks"),
    BrandModel(name: "Apple", remarks: ""),
    BrandModel(name: "Huawei", remarks: "some remarks"),
    BrandModel(name: "Sony", remarks: ""),
  ];

  List<OrderModel> orderData = [
    OrderModel(
        phone: "9315121614",
        email: "baani.sunpreet@gmail.com",
        amount: "200",
        customerName: "Sunpreet Singh",
        deviceName: "Sony",services:["Screen Damage", "Camera Repair"]),
    OrderModel(
        phone: "9873575079",
        email: "sunpreet@gmail.com",
        amount: "200",services:["Screen Damage", "Camera Repair"],
        customerName: "Aman Singh",
        deviceName: "iPhone")
  ];


}
