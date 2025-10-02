import 'package:freezed_annotation/freezed_annotation.dart';
import 'course.dart';

part 'available_section.freezed.dart';
part 'available_section.g.dart';

@freezed
class AvailableSection with _$AvailableSection {
  const factory AvailableSection({
    @JsonKey(name: 'section_id') required int sectionId,
    @JsonKey(name: 'course_id') int? courseId,
    @JsonKey(name: 'term_id') int? termId,
    @JsonKey(name: 'faculty_id') int? facultyId,
    @JsonKey(name: 'section_number') String? sectionNumber,
    @JsonKey(name: 'current_enrollment') int? currentEnrollment,
    Course? course,
  }) = _AvailableSection;

  factory AvailableSection.fromJson(Map<String, dynamic> json) =>
      _$AvailableSectionFromJson(json);
}