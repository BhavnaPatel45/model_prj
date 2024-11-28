import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomeBinding extends Bindings{
   @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}