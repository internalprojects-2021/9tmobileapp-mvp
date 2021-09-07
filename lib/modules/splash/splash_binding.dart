import 'package:get/get.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalService>(() => LocalService());
    Get.lazyPut(
      () => SplashController(localService: Get.find()),
    );
  }
}
