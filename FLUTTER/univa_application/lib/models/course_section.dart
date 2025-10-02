import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_section.freezed.dart';
part 'course_section.g.dart';

@freezed
class CourseSection with _$CourseSection {
  const factory CourseSection({
    required int id,
    @JsonKey(name: 'courseId') required int courseId,
    @JsonKey(name: 'termId') required int termId,
    @JsonKey(name: 'FacultyId') int? facultyId,
    @JsonKey(name: 'sectionNumber') required String sectionNumber,
    @JsonKey(name: 'currentEnrollment') int? currentEnrollment,
    String? content,
  }) = _CourseSection;

  factory CourseSection.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionFromJson(json);
}