import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/common/rest_api.dart';
// import 'package:mobileapp/data/service/auth_service.dart';

class BaseService extends GetxService {
  late RestAPI client;
  final dio = Dio();

  @override
  void onInit() {
    dio.interceptors.add(LogInterceptor(
        responseHeader: false,
        responseBody: true,
        request: true,
        requestBody: true));
    // logPrint: NetUtils.printCustom));
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      dio.interceptors.requestLock.lock();
      // AuthService authService = Get.find();
      // final token = authService.token();
      // if (token != null) {
      //   options.headers['Authorization'] = token;
      // }
      print(options.headers);
      dio.interceptors.requestLock.unlock();
      handler.next(options);
    }));
    client = RestAPI(dio);
    super.onInit();
  }
}
