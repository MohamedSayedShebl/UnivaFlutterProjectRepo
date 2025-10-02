import 'package:dio/dio.dart';
import 'package:univa_application/core/network/api_services.dart';
import '../../core/network/api_result.dart';
import '../models/course.dart';

class CourseRepo {
  final ApiServices _api;

  CourseRepo(this._api);

  Future<ApiResult<List<Course>>> fetchCourses() async {
    try {
      final resp = await _api.getCoursesRaw();
      final rawData = _normalizeResponseToList(resp.data);
      final courses = rawData.map((e) => Course.fromJson(e as Map<String, dynamic>)).toList();
      return ApiResult.success(courses);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['message'] ?? e.message ?? "Unknown error");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

    Future<ApiResult<Course>> fetchCourse(int id) async {
      try {
    final resp = await _api.getCourseRaw(id);
    final rawData = _normalizeResponseToMap(resp.data);

    final course = Course.fromJson(rawData);
    return ApiResult.success(course);
  } on DioException catch (e) {
    return ApiResult.failure(e.response?.data['message'] ?? e.message ?? "Unknown error");
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

  Future<ApiResult<Course>> createCourse(Map<String, dynamic> payload) async {
    try {
      final data = await _api.createCourse(payload);
      return ApiResult.success(data);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['message'] ?? e.message ?? "Unknown error");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Course>> updateCourse(int id, Map<String, dynamic> payload) async {
    try {
      final data = await _api.updateCourse(id, payload);
      return ApiResult.success(data);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['message'] ?? e.message ?? "Unknown error");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> deleteCourse(int id) async {
    try {
      await _api.deleteCourse(id);
      return const ApiResult.success(null);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['message'] ?? e.message ?? "Unknown error");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }


}
List<dynamic> _normalizeResponseToList(dynamic resp) {
  if (resp == null) return <dynamic>[];

  if (resp is List) return resp;

  if (resp is Map<String, dynamic> && resp['data'] is List) {
    return resp['data'] as List<dynamic>;
  }

  throw Exception('Unexpected response shape: ${resp.runtimeType}');
}

Map<String, dynamic> _normalizeResponseToMap(dynamic resp) {
  if (resp == null) return {};

  if (resp is Map<String, dynamic>) {

    if (resp.containsKey('data') && resp['data'] is Map<String, dynamic>) {
      return resp['data'] as Map<String, dynamic>;
    }
    return resp;
  }

  throw Exception('Unexpected response shape: ${resp.runtimeType}');
}