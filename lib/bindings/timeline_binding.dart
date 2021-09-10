import 'package:covid_fl/controllers/timeline_controller.dart';
import 'package:get/get.dart';

class TimeLineBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TimeLineController>((){
      return TimeLineController();
    } );
  }

}