import 'package:phone_tech_london/controllers/add_laptop_controller.dart';
import 'package:get/get.dart';

class AddLaptopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLaptopController>(() {
      return AddLaptopController();
    });
  }
}
