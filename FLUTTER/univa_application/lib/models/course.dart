import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    @JsonKey(name: 'course_id') required int? id,
    @JsonKey(name: 'course_name') String? courseName,
    @JsonKey(name: 'course_code') required String? courseCode,
    String? description,
    @JsonKey(name: 'credit_hours') int? creditHours,
    @JsonKey(name: 'is_active') bool? is_active,
    List<dynamic>? prerequisites,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}