import 'package:covid_fl/controllers/brand_list_controller.dart';
import 'package:get/get.dart';

class BrandListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandListController>(() {
      return BrandListController();
    });
  }
}
