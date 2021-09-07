import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/main.dart';

void main() {
  AppConfig _config = AppConfig(
    env: Environment.PRODUCTION, 
    config: {
      BASE_URL: 'https://api.npoint.io/2f7382f24a63d233653f/',
    });
  Get.put<AppConfig>(_config, permanent: true);
  mainDelegate();
}
