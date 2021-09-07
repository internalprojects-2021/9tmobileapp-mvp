import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class LocalService extends GetxService {
  static const String CONSUMER_KEY = "_consumerKey";
  static const String CONSUMER_SECRET = "_consumerSecret";
  static const String FIREBASE_UUID = "_firebaseUUID";
  static const String USER_PHONE_NUMBER = "_userPhoneNumber";
  static const String COUNT_CLICK_ON = "_countClickOn";
  static const String POSITION_SCROLL = "_positionScroll";
  static const String NOTIFICATION = "_notification";
  static const String FIRST_TIME_USE = "_firstTimeUse";
  static const String NOTICE_SEEN = "_noticeSeen";
  static const String URL_INTRO = "_urlIntro";
  static const String HIDE_VIDEO_GUIDE = "_hideVideoGuide";
  static const String HIDE_EX_GUIDE = "_hideVExGuide";
  static const String HIDE_GUIDE = "_hideVExGuide";
  static const String SPEED_SETTING = "_speedSetting";
  static const String VOICE_SETTING = "_voiceSetting";

  GetStorage? _storage;

  GetStorage get box {
    if (_storage == null) {
      _storage = GetStorage();
    }
    return _storage!;
  }

  Future get init => box.initStorage;

  Future cacheToken(String token) {
    return box.write('_token', token);
  }

  bool isFistTimeUse() {
    bool? v = box.read(FIRST_TIME_USE);
    return v == null;
  }

  Future setUsed() {
    return box.write(FIRST_TIME_USE, false);
  }

  String read(String key) => box.read(key);

  Future write(String key, String value) {
    return box.write(key, value);
  }

  bool has(String key) => box.hasData(key);

  String get token => box.read('_token');
}
