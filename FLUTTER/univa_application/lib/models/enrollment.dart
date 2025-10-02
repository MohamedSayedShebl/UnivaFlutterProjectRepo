import 'package:freezed_annotation/freezed_annotation.dart';
part 'enrollment.freezed.dart';
part 'enrollment.g.dart';

@freezed
class Enrollment with _$Enrollment {
  const factory Enrollment({
    required int? enrollmentId,
    required int? studentId,
    required int? sectionId,
    DateTime? enrollmentDate,
    String? status,
    String? finalGrade,
    int? result,
    CourseSectionInfo? section,
  }) = _Enrollment;

 factory Enrollment.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentFromJson(json);
}

@freezed
class CourseSectionInfo with _$CourseSectionInfo {
  const factory CourseSectionInfo({
    required int? sectionId,
    required int? courseId,
    required int? termId,
    int? facultyId,
    String? sectionNumber,
    int? currentEnrollment,
    CourseInfo? course,
  }) = _CourseSectionInfo;

  factory CourseSectionInfo.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionInfoFromJson(json);
}

@freezed
class CourseInfo with _$CourseInfo {
  const factory CourseInfo({
    required int? courseId,
    required String? courseCode,
    required String? courseName,
    String? description,
    int? creditHours,
    List<CoursePrerequisite>? coursePrerequisites,
  }) = _CourseInfo;

  factory CourseInfo.fromJson(Map<String, dynamic> json) =>
      _$CourseInfoFromJson(json);
}

@freezed
class CoursePrerequisite with _$CoursePrerequisite {
  const factory CoursePrerequisite({
    required int? prerequisiteCourseId,
    String? courseName,
  }) = _CoursePrerequisite;

  factory CoursePrerequisite.fromJson(Map<String, dynamic> json) =>
      _$CoursePrerequisiteFromJson(json);
}

