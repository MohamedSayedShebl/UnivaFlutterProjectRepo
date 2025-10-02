// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableSectionImpl _$$AvailableSectionImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableSectionImpl(
      sectionId: (json['section_id'] as num).toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      termId: (json['term_id'] as num?)?.toInt(),
      facultyId: (json['faculty_id'] as num?)?.toInt(),
      sectionNumber: json['section_number'] as String?,
      currentEnrollment: (json['current_enrollment'] as num?)?.toInt(),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AvailableSectionImplToJson(
        _$AvailableSectionImpl instance) =>
    <String, dynamic>{
      'section_id': instance.sectionId,
      'course_id': instance.courseId,
      'term_id': instance.termId,
      'faculty_id': instance.facultyId,
      'section_number': instance.sectionNumber,
      'current_enrollment': instance.currentEnrollment,
      'course': instance.course,
    };
