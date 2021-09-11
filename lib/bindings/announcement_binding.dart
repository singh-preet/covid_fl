import 'package:covid_fl/controllers/announcement_controller.dart';
import 'package:get/get.dart';

class AnnouncementBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementController>((){
      return AnnouncementController();
    });
  }

}