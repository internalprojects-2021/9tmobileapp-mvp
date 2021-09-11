import 'dart:async';
import 'package:get/get.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SplashController extends GetxController {
  LocalService localService;
  AccountService accountService;
  var connectionStatus = "".obs;
  var version = Rx<String>("");
  SplashController({required this.localService, required this.accountService});

  Future start() async {
    // Load master data
    await localService.init;

    // Check auto login
    await Future.delayed(Duration(seconds: 3));
    accountService.setAccount(Account(id: "123"));
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
