import 'package:get/get.dart';
import 'package:mobileapp/modules/record_story/record_story_binding.dart';
import 'package:mobileapp/modules/record_story/record_story_page.dart';
import 'package:mobileapp/modules/splash/splash_binding.dart';
import 'package:mobileapp/modules/splash/splash_page.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.RECORD_STORY,
      page: () => RecordStoryPage(),
      binding: RecordStoryBinding(),
    ),
  ];
}