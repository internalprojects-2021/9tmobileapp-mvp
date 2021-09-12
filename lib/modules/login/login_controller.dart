import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class LoginController extends GetxController {
  LocalService localService;
  AccountService accountService;

  LoginController({required this.localService, required this.accountService});

  TextEditingController userIdTFController = TextEditingController();

  Future start() async {
    // Load master data
    await localService.init;
    return Future;
  }

  loginWithDefaultId() {
    accountService.setAccount(Account(id: "001"));
    Get.toNamed(Routes.RECORD_STORY);
  }

  loginWithUserId() {
    accountService.setAccount(Account(id: userIdTFController.text));
    Get.toNamed(Routes.RECORD_STORY);
  }

    @override
  void onInit() {
    start();
    super.onInit();
  }
}
