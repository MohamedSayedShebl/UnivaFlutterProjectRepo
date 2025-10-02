import 'package:dio/dio.dart';
import '../core/network/api_result.dart';
import '../core/network/api_services.dart';
import '../models/user.dart';

class AdminUserRepository {
  final ApiServices _api;
  AdminUserRepository(this._api);

    Future<ApiResult<User>> createUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String role,

    String? dateOfBirth,
    String? position,    // faculty only
    String? department,  // faculty only
    String? phone,       // student only
    String? address,     // student only
    String? level,       // student only
    String? gpa,         // student only
    String? totalCredits // student only
  }) async {
    try {
      final payload = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'role': role,
      };
      if (phone != null) payload['phone'] = phone;
      if (address != null) payload['address'] = address;
      if (dateOfBirth != null) payload['date_of_birth'] = dateOfBirth;
      if (position != null) payload['position'] = position;
      if (department != null) payload['department'] = department;

      // Student-specific
      if (role == 'student') {
        if (level != null) payload['level'] = level;
        if (gpa != null) payload['gpa'] = gpa;
        if (totalCredits != null) payload['total_credits'] = totalCredits;
      }

      print('SENDING PAYLOAD: $payload'); //this line for debugging

      final user = await _api.createUser(payload);
      return ApiResult.success(user);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }



  Future<ApiResult<List<User>>> getUsers() async {
    try {
      final resp = await _api.getUsersRaw();
       final raw = _normalizeResponseToList(resp.data);
      final users =
          raw.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
      return ApiResult.success(users);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }


  Future<ApiResult<List<User>>> getStudents() async {
    try {
      final resp = await _api.getStudentsRaw();
       final raw = _normalizeResponseToList(resp.data);
      final users =
          raw.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
      return ApiResult.success(users);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<User>>> getFaculties() async {
    try {
      final resp = await _api.getFacultiesRaw();
       final raw = _normalizeResponseToList(resp.data);
      final users =
          raw.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
      return ApiResult.success(users);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<User>> editUser(int id, Map<String, dynamic> data) async {
  try {
    final user = await _api.editUser(id, data);
    return ApiResult.success(user);
  } on DioException catch (e) {
    final serverMsg = e.response?.data ?? e.message;
    return ApiResult.failure(serverMsg.toString());
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

Future<ApiResult<void>> deleteUser(int id) async {
  try {
    await _api.deleteUser(id);
    return const ApiResult.success(null);
  } on DioException catch (e) {
    final serverMsg = e.response?.data ?? e.message;
    return ApiResult.failure(serverMsg.toString());
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

/// Helper: normalizes API response into a List<dynamic>.
/// Supports both:
/// - raw List
/// - Map with "data" key
  List<dynamic> _normalizeResponseToList(dynamic resp) {
    if (resp == null) return <dynamic>[];

    // Already a list
    if (resp is List) return resp;

    // Laravel style: { "data": [...] }
    if (resp is Map<String, dynamic> && resp['data'] is List) {
      return resp['data'] as List<dynamic>;
    }

    throw Exception('Unexpected response shape: ${resp.runtimeType}');
  }

  
}
