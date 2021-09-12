import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SplashController extends GetxController {
  LocalService localService;
  AccountService accountService;

  SplashController({required this.localService, required this.accountService});

  TextEditingController userIdTFController = TextEditingController();

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
    // await start();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loginWithDefaultId() {
    accountService.setAccount(Account(id: "100"));
    Get.toNamed(Routes.RECORD_STORY);
  }

  loginWithUserId() {
    accountService.setAccount(Account(id: userIdTFController.text));
    Get.toNamed(Routes.RECORD_STORY);
  }
}
