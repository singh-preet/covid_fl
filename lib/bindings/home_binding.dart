import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });

    Get.lazyPut<GenerateInvoiceController>(() {
      return GenerateInvoiceController();
    });
  }
}
