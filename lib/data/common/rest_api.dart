import 'package:dio/dio.dart';
import 'package:mobileapp/data/models/base_response.dart';
import 'package:mobileapp/data/models/story.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "https://api.npoint.io/2f7382f24a63d233653f/data")
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  @GET("/story")
  Future<Story> getStory(@Body() Map<String, dynamic> body);
  
}
