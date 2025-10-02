// lib/core/repositories/auth_repo.dart
import 'package:univa_application/core/network/api_result.dart';
import 'package:univa_application/core/network/api_services.dart';
import 'package:univa_application/models/login_response.dart';
import 'package:univa_application/models/logout_response.dart';

class AuthRepo {
  final ApiServices _api;

  AuthRepo(this._api);

  Future<ApiResult<LoginResponse>> login(String username, String password) async {
    try {
      final response = await _api.login({
        "username": username,
        "password": password,
      });
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<LogoutResponse>> logout(int userId) async {
    try {
      final response = await _api.logout(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
