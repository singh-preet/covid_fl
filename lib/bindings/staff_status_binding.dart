import 'package:covid_fl/controllers/staff_status_controller.dart';
import 'package:get/get.dart';

class StaffStatusBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StaffStatusController>((){
      return StaffStatusController();
    });
  }
}