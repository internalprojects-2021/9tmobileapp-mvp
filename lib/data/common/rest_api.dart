import 'package:dio/dio.dart';
import 'package:mobileapp/data/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  @POST("/auth/login_with_google")
  Future<BaseResponse> googleLogin(@Body() Map<String, dynamic> body);
  
}
