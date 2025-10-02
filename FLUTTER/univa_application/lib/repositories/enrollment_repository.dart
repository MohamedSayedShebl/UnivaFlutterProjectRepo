import 'package:univa_application/core/network/api_services.dart';

import '../core/network/api_result.dart';
import '../models/available_section.dart';
import '../models/enrollment.dart';

class EnrollmentRepository {
  final ApiServices _apiService;
  EnrollmentRepository(this._apiService);

  Future<ApiResult<List<AvailableSection>>> getAvailableEnrollments() async {
    try {
      final resp = await _apiService.getAvailableEnrollmentsRaw();
      final rawData = _normalizeResponseToList(resp.data);
      final sections = rawData
          .map((e) => AvailableSection.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiResult.success(sections);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<Enrollment>>> createEnrollments(List<Map<String, dynamic>> enrollments) async {
  try {
    final response = await _apiService.createEnrollmentsRaw({'enrolments': enrollments});
    
    final responseData = response.data;
    print('Response data type: ${responseData.runtimeType}');
    print('Response data: $responseData');
    
    final rawData = _normalizeResponseToList(responseData);
    final enrollmentsList = rawData
        .map((e) => Enrollment.fromJson(e as Map<String, dynamic>))
        .toList();
    
    return ApiResult.success(enrollmentsList);
  } catch (e, stackTrace) {
    print('Error in createEnrollments: $e');
    print('Stack trace: $stackTrace');
    return ApiResult.failure(e.toString());
  }
}

  Future<ApiResult<List<Enrollment>>> updateEnrollments(List<Map<String, dynamic>> enrollments) async {
    try {
      final response = await _apiService.updateEnrollments({'enrolments': enrollments});
      final rawData = _normalizeResponseToList(response);
      final enrollmentsList = rawData
          .map((e) => Enrollment.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiResult.success(enrollmentsList);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

Future<ApiResult<List<Enrollment>>> getAllEnrollments(int studentId) async {
  try {
    final response = await _apiService.getAllEnrollmentsRaw(studentId);
    final rawData = _normalizeResponseToList(response.data);
    
    final enrollmentsList = rawData
        .map((e) => _mapApiResponseToEnrollment(e as Map<String, dynamic>))
        .toList();
    
    return ApiResult.success(enrollmentsList);
  } catch (e) {
    print('Error in getAllEnrollments: $e');
    return ApiResult.failure(e.toString());
  }
}

Enrollment _mapApiResponseToEnrollment(Map<String, dynamic> json) {
  final courseJson = json['course'] as Map<String, dynamic>?;
  
  return Enrollment(
    enrollmentId: json['enrollment_id'] as int?,
    studentId: json['student_id'] as int?,
    sectionId: json['section_id'] as int?,
    enrollmentDate: json['enrollment_date'] != null 
        ? DateTime.parse(json['enrollment_date'] as String)
        : null,
    status: json['status'] as String?,
    finalGrade: json['final_grade'] as String?,
    result: json['result'] as int?,
    section: CourseSectionInfo(
      sectionId: json['section_id'] as int?,
      courseId: courseJson?['course_id'] as int?,
      termId: (json['term'] as Map<String, dynamic>)['term_id'] as int?,
      sectionNumber: 'Section ${json['section_id']}',
      currentEnrollment: 0,
      course: courseJson != null 
          ? CourseInfo(
              courseId: courseJson['course_id'] as int?,
              courseCode: courseJson['course_code'] as String?,
              courseName: courseJson['course_name'] as String?,
              description: courseJson['description'] as String?,
              creditHours: courseJson['credit_hours'] as int?,
              coursePrerequisites: [],
            )
          : null,
    ),
  );
}

  Future<ApiResult<List<Enrollment>>> getCurrentEnrollments(int studentId) async {
    try {
      final response = await _apiService.getCurrentEnrollments(studentId);
      final rawData = _normalizeResponseToList(response);
      final enrollmentsList = rawData
          .map((e) => Enrollment.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiResult.success(enrollmentsList);
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