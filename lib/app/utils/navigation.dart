import 'package:get/get.dart';
import 'package:model_prj/app/modules/auth/login/controllers/login_controller.dart';
import 'package:model_prj/app/modules/auth/login/views/login_view.dart';

import '../modules/homepage/controllers/homepage_controller.dart';
import '../modules/homepage/views/homepage_view.dart';

class Navigation {
  openHomePage() {
    Get.delete<HomeController>();
    Get.to(() =>HomeView());
  }
   openLoginPage() {
    Get.delete<LoginController>();
    Get.to(() =>LoginView());
  }
}
