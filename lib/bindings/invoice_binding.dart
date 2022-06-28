import 'package:get/get.dart';
import 'package:phone_tech_london/controllers/generate_invoice_controller.dart';
import 'package:phone_tech_london/controllers/service_detail_controller.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateInvoiceController>(() {
      return GenerateInvoiceController();
    });

    Get.lazyPut<ServiceDetailController>(() {
      return ServiceDetailController();
    });
  }
}
