import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_prj/app/modules/auth/authentication.dart';

import '../../../../utils/validation.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final authRepo = Get.put(AuthenticationRepository());
  final validation = Validation();

  Future<void> login() async {
    try {
      String email = emailController.text.trim();
      String password = passController.text.trim();
     await authRepo.loginWithEmailAndPassword(email, password);
    } catch (error) {
      Get.snackbar('Login Failed', error.toString(), backgroundColor: Colors.red);
    }
  }
}
