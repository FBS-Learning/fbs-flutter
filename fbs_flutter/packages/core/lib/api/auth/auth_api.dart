import 'package:core/interceptors/http_basic_interceptors.dart';
import 'package:core/models/oauth_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dio) {
    String baseUrl = dotenv.env['HOST.SECURITY'] ?? '';
    dio.interceptors.add(HttpBasicInterceptors());
    return _AuthAPI(dio, baseUrl: baseUrl);
  }

  @FormUrlEncoded()
  @POST("/api/security/oauth/force")
  Future<OAuthResponse> login(@Body() Map<String, dynamic> body);
}
