import 'package:core/api/auth/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  AuthAPI? _authAPI;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    String clientId = dotenv.env['CLIENT_ID'] ?? '';
    Map<String, dynamic> body = {
      'grant_type': 'password',
      'username': username,
      'password': password,
      'client_id': clientId
    };
    _authAPI = AuthAPI(Dio());
    await _authAPI?.login(body).then((value) {
      print(value.toString());
    });
  }
}
