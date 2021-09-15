import 'package:covid_fl/controllers/leaderboard_controller.dart';
import 'package:get/get.dart';

class LeaderBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardController>((){
      return LeaderBoardController();
    });
  }

}