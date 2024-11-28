import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_prj/app/utils/navigation.dart';

import '../../../../utils/validation.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        Scaffold(
      body: buildBody(context),
      // )
    );
  }

  buildBody(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
        key: _loginController.loginForm,
        child: SingleChildScrollView(
          child: Center(
              child: SizedBox(
            width: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                Image.asset(
                  'assets/user.png',
                  height: 120,
                  width: 120,
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  // height: 50,
                  child: TextFormField(
                    validator: (value) {
                      return _loginController.validation.validateEmail(value);
                    },
                    controller: _loginController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontFamily: 'Parkinsans'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  // height: 50,
                  child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        return _loginController.validation.validatePassword(value!);
                      },
                      controller: _loginController.passController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontFamily: 'Parkinsans'),
                        border: OutlineInputBorder(),
                      )),
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(fontFamily: 'Parkinsans'),
                  )
                ]),
                SizedBox(height: 15),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Navigation().openHomePage();
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_loginController.loginForm.currentState!
                            .validate()) {
                          _loginController.loginForm.currentState!.save();
                          await _loginController.login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4f60ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text('Log In',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Parkinsans')),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                            thickness: 0.2,
                            endIndent: 10,
                            color: Colors.black)),
                    Text(
                      "OR",
                      style: TextStyle(fontFamily: 'Parkinsans'),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.2,
                      indent: 10,
                      color: Colors.black,
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4f60ff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text('Google',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Parkinsans')),
                    )),
              ],
            ),
          )),
        ));
  }
}
