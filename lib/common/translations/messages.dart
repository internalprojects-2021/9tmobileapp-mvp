import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': {
          Keys.homeMenu: "Trang chủ",
        },
        'ja_JP': {
          Keys.homeMenu: "ホームページ",
        }
      };
}

class Keys {
  static String get homeMenu => 'homeMenu';
  static String get notificationMenu => 'notificationMenu';
}
