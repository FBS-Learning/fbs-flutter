import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpBasicInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String clientId = dotenv.env['CLIENT_ID'] ?? '';
    String clientSecret = dotenv.env['CLIENT_SECRET'] ?? '';
    final String auth = base64Encode(utf8.encode('$clientId:$clientSecret'));
    options.headers['authorization'] = 'Basic $auth';
    super.onRequest(options, handler);
  }
}
