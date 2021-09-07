import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/modules/splash/splash_controller.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class SplashPage extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(child: Center(child: Text('Welcome')));
  }
}
