// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: (json['course_id'] as num?)?.toInt(),
      courseName: json['course_name'] as String?,
      courseCode: json['course_code'] as String?,
      description: json['description'] as String?,
      creditHours: (json['credit_hours'] as num?)?.toInt(),
      is_active: json['is_active'] as bool?,
      prerequisites: json['prerequisites'] as List<dynamic>?,
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'course_id': instance.id,
      'course_name': instance.courseName,
      'course_code': instance.courseCode,
      'description': instance.description,
      'credit_hours': instance.creditHours,
      'is_active': instance.is_active,
      'prerequisites': instance.prerequisites,
    };
