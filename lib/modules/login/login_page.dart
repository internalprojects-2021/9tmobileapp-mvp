import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobileapp/widgets/wrap_page.dart';
import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller.userIdTFController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "Enter your account id (such as 100)"),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: TextButton(onPressed: () => controller.loginWithUserId(), child: Text("Login"))),
                TextButton(onPressed: () => controller.loginWithDefaultId(), child: Text("Skip login"))
              ],
            )));
  }
}
