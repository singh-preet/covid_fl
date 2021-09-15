import 'package:covid_fl/bindings/announcement_binding.dart';
import 'package:covid_fl/bindings/home_binding.dart';
import 'package:covid_fl/bindings/login_binding.dart';
import 'package:covid_fl/bindings/splash_binding.dart';
import 'package:covid_fl/bindings/staff_binding.dart';
import 'package:covid_fl/bindings/timeline_binding.dart';
import 'package:covid_fl/features/admin/post_announcement.dart';
import 'package:covid_fl/features/admin/staff_status.dart';
import 'package:covid_fl/features/home/home.dart';
import 'package:covid_fl/features/login_screen/login_screen.dart';
import 'package:covid_fl/features/splash_screen/splash_screen.dart';
import 'package:covid_fl/features/staff_directory/staff_directory.dart';
import 'package:covid_fl/features/timeline/timeline.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages=<GetPage>[
    GetPage(name: Routes.INITIAL, page: ()=>SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.LOGIN, page: ()=>LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: ()=>Home(), bindings: [HomeBinding(), StaffBinding(),]),
    GetPage(name: Routes.TIMELINE, page: ()=>TimeLine(), binding: TimeLineBinding()),
    GetPage(name: Routes.STAFF, page: ()=>StaffDirectory(), binding: StaffBinding()),
    GetPage(name: Routes.POST_ANNOUNCEMENT, page: ()=>PostAnnouncement(), binding: AnnouncementBinding()),
    GetPage(name: Routes.STAFF_STATUS, page: ()=>StaffStatus(), binding: AnnouncementBinding()),
  ];
}