import 'package:get/get.dart';
import 'package:mobileapp/data/service/local_service.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalService>(() => LocalService());
    Get.lazyPut(
      () => LoginController(localService: Get.find(), accountService: Get.find()),
    );
  }
}
