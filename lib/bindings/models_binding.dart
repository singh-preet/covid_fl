import 'package:get/get.dart';

import '../controllers/model_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() {
      return ProductListController();
    });
  }
}
