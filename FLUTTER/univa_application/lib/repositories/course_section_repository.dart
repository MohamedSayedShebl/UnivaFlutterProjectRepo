import 'package:univa_application/core/network/api_services.dart';
import '../core/network/api_result.dart';
import '../models/course_section.dart';

class CourseSectionRepository {
  final ApiServices apiService;
  CourseSectionRepository(this.apiService);

  Future<ApiResult<List<CourseSection>>> getAllSections() async {
    try {
      final response = await apiService.getAllCourseSections();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CourseSection>> getSectionById(int id) async {
    try {
      final response = await apiService.getCourseSectionById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CourseSection>> updateSection(int id, Map<String, dynamic> body) async {
    try {
      final response = await apiService.updateCourseSection(id, body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> deleteSection(int id) async {
    try {
      await apiService.deleteCourseSection(id);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<CourseSection>>> getCurrentSections() async {
    try {
      final response = await apiService.getCurrentCourseSections();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
