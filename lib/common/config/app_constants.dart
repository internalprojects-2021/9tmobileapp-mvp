
enum Environment { PRODUCTION, STAGING }

const String HOST = "_host";
const String API = "_api";
const String BASE_URL = "_baseurl";

class AppConfig {
  Map<String, dynamic> config;
  Environment env;
  AppConfig({required this.config, required this.env});

  get host => config[HOST];
  get baseURL => config[BASE_URL];
}
