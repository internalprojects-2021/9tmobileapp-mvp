import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/common/theme/app_theme.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/data/service/story_service.dart';
import 'package:mobileapp/data/service/theme_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

void mainDelegate() async {
  Get.put<LocalService>(LocalService(), permanent: true);
  Get.put<AccountService>(AccountService(localService: Get.find()), permanent: true);
  Get.put<StoryService>(StoryService(), permanent: true);
  Get.lazyPut<FileService>(() => FileService());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
      ));

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  var getMaterialApp = GetMaterialApp(
    themeMode: ThemeService().getThemeMode(),
    // supportedLocales: [
    //   Locale('en', 'US'),
    //   Locale('vi', 'VN'),
    // ],
    // localizationsDelegates: [
    //   AppLocalizations.delegate,
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    // ],
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    getPages: AppPages.pages,
    initialRoute: Routes.SPLASH,
    initialBinding: BindingsBuilder(() {}),
  );

  // To lock portrait orientation screen and run app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(getMaterialApp);
  });
}
