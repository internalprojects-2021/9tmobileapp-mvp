import 'dart:async';
import 'package:get/get.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SplashController extends GetxController {
  LocalService localService;
  var connectionStatus = "".obs;
  var version = Rx<String>("");
  SplashController({required this.localService});

  Future start() async {
    // Load master data
    await localService.init;

    // Check auto login
    await Future.delayed(Duration(seconds: 3));

    // Open page
    Get.offAllNamed(Routes.RECORD_STORY);
    return Future;
  }

  @override
  void onInit() async {
    await start();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
