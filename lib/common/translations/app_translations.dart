final Map<String, String> enUs = {
  // 'login': 'Login', 'register': 'Register',
};

final Map<String, String> viVn = {
  // 'login': 'Đăng nhập', 'register': 'Đăng ký',
};


abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'vi_VN': viVn,
  };
}
