import 'package:phone_tech_london/bindings/add_laptop_binding.dart';
import 'package:phone_tech_london/bindings/api_service_binding.dart';
import 'package:phone_tech_london/bindings/dio_binding.dart';
import 'package:phone_tech_london/bindings/home_binding.dart';
import 'package:phone_tech_london/bindings/invoice_binding.dart';
import 'package:phone_tech_london/bindings/login_binding.dart';
import 'package:phone_tech_london/bindings/splash_binding.dart';
import 'package:phone_tech_london/features/home/home.dart';
import 'package:phone_tech_london/features/invoice/generate_invoice.dart';
import 'package:phone_tech_london/features/laptop/add_laptop_screen.dart';
import 'package:phone_tech_london/features/login_screen/login_screen.dart';
import 'package:phone_tech_london/features/splash_screen/splash_screen.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:get/get.dart';
import '../bindings/brand_list_binding.dart';
import '../bindings/models_binding.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen(), bindings: [
      DioBinds(),
      ApiServiceBinds(),
      LoginBinding(),
    ]),
    GetPage(name: Routes.HOME, page: () => Home(), bindings: [
      HomeBinding(),
      BrandListBinding(),
      ProductListBinding(),
    ]),
    GetPage(
        name: Routes.ADD_LAPTOP,
        page: () => AddLaptop(),
        binding: AddLaptopBinding()),
    GetPage(name: Routes.GENERATE_ORDER, page: () => GenerateInvoice(), binding: InvoiceBinding())
  ];
}
