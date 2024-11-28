import 'package:get/get.dart';
import 'package:model_prj/app/modules/auth/authentication.dart';

class HomeController extends GetxController {
  AuthenticationRepository authRepo = Get.put(AuthenticationRepository());
  List<String> avatarImages = [
    'assets/avatar.png',
    'assets/avatar2.jpeg',
    'assets/office.png',
    'assets/avatar.png',
    'assets/avatar2.jpeg',
  ];
}
