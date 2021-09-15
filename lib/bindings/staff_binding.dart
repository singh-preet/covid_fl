import 'package:covid_fl/controllers/staff_controller.dart';
import 'package:get/get.dart';

class StaffBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StaffController>(() {
      return StaffController();
    });
  }

}