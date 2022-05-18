import 'package:covid_fl/bindings/api_service_binding.dart';
import 'package:covid_fl/bindings/dio_binding.dart';
import 'package:covid_fl/bindings/home_binding.dart';
import 'package:covid_fl/bindings/login_binding.dart';
import 'package:covid_fl/bindings/splash_binding.dart';
import 'package:covid_fl/features/home/home.dart';
import 'package:covid_fl/features/login_screen/login_screen.dart';
import 'package:covid_fl/features/splash_screen/splash_screen.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/widgets/brand_list_widget.dart';
import 'package:covid_fl/widgets/product_list_widget.dart';
import 'package:get/get.dart';
import '../bindings/brand_list_binding.dart';
import '../bindings/product_list_binding.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.HOME, page: () => Home(), bindings: [HomeBinding(),BrandListBinding(),ProductListBinding()]),
    GetPage(
        name: Routes.LOGIN, page: () => LoginScreen(), bindings: [ApiServiceBinds(),DioBinds(), LoginBinding(),]),
    // GetPage(
    //     name: Routes.BRANDS_LIST,
    //     page: () => BrandListWidget(),
    //     binding: BrandListBinding()),
    // GetPage(
    //     name: Routes.PRODUCT_LIST,
    //     page: () => ProductListWidget(),
    //     binding: ProductListBinding())
  ];
}
