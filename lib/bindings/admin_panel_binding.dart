import 'package:covid_fl/controllers/admin_panel_controller.dart';
import 'package:get/get.dart';

class AdminPanelBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdminPanelController>((){
      return AdminPanelController();
    });
  }
}