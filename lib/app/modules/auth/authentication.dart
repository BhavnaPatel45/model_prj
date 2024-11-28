import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/navigation.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _initializeUser();
  }

  void _initializeUser() {
    final user = _auth.currentUser;
    if (user == null) {
      // Only navigate to login if the current route is not already the login page
      if (!Get.currentRoute.contains(Routes.LOGIN)) {
        Get.offNamed(Routes.LOGIN);
      }
    } else {
      // Only navigate to home if the current route is not already the home page
      if (!Get.currentRoute.contains(Routes.HOME)) {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigation().openHomePage();
      Get.snackbar('Welcome', email.toString(),
          backgroundColor: Colors.green.shade400);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(),
          backgroundColor: Colors.red.shade400);
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
