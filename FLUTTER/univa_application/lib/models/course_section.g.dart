// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseSectionImpl _$$CourseSectionImplFromJson(Map<String, dynamic> json) =>
    _$CourseSectionImpl(
      id: (json['id'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      termId: (json['termId'] as num).toInt(),
      facultyId: (json['FacultyId'] as num?)?.toInt(),
      sectionNumber: json['sectionNumber'] as String,
      currentEnrollment: (json['currentEnrollment'] as num?)?.toInt(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$CourseSectionImplToJson(_$CourseSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'termId': instance.termId,
      'FacultyId': instance.facultyId,
      'sectionNumber': instance.sectionNumber,
      'currentEnrollment': instance.currentEnrollment,
      'content': instance.content,
    };
