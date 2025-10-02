// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrollmentImpl _$$EnrollmentImplFromJson(Map<String, dynamic> json) =>
    _$EnrollmentImpl(
      enrollmentId: (json['enrollmentId'] as num?)?.toInt(),
      studentId: (json['studentId'] as num?)?.toInt(),
      sectionId: (json['sectionId'] as num?)?.toInt(),
      enrollmentDate: json['enrollmentDate'] == null
          ? null
          : DateTime.parse(json['enrollmentDate'] as String),
      status: json['status'] as String?,
      finalGrade: json['finalGrade'] as String?,
      result: (json['result'] as num?)?.toInt(),
      section: json['section'] == null
          ? null
          : CourseSectionInfo.fromJson(json['section'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnrollmentImplToJson(_$EnrollmentImpl instance) =>
    <String, dynamic>{
      'enrollmentId': instance.enrollmentId,
      'studentId': instance.studentId,
      'sectionId': instance.sectionId,
      'enrollmentDate': instance.enrollmentDate?.toIso8601String(),
      'status': instance.status,
      'finalGrade': instance.finalGrade,
      'result': instance.result,
      'section': instance.section,
    };

_$CourseSectionInfoImpl _$$CourseSectionInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseSectionInfoImpl(
      sectionId: (json['sectionId'] as num?)?.toInt(),
      courseId: (json['courseId'] as num?)?.toInt(),
      termId: (json['termId'] as num?)?.toInt(),
      facultyId: (json['facultyId'] as num?)?.toInt(),
      sectionNumber: json['sectionNumber'] as String?,
      currentEnrollment: (json['currentEnrollment'] as num?)?.toInt(),
      course: json['course'] == null
          ? null
          : CourseInfo.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseSectionInfoImplToJson(
        _$CourseSectionInfoImpl instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'courseId': instance.courseId,
      'termId': instance.termId,
      'facultyId': instance.facultyId,
      'sectionNumber': instance.sectionNumber,
      'currentEnrollment': instance.currentEnrollment,
      'course': instance.course,
    };

_$CourseInfoImpl _$$CourseInfoImplFromJson(Map<String, dynamic> json) =>
    _$CourseInfoImpl(
      courseId: (json['courseId'] as num?)?.toInt(),
      courseCode: json['courseCode'] as String?,
      courseName: json['courseName'] as String?,
      description: json['description'] as String?,
      creditHours: (json['creditHours'] as num?)?.toInt(),
      coursePrerequisites: (json['coursePrerequisites'] as List<dynamic>?)
          ?.map((e) => CoursePrerequisite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourseInfoImplToJson(_$CourseInfoImpl instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'description': instance.description,
      'creditHours': instance.creditHours,
      'coursePrerequisites': instance.coursePrerequisites,
    };

_$CoursePrerequisiteImpl _$$CoursePrerequisiteImplFromJson(
        Map<String, dynamic> json) =>
    _$CoursePrerequisiteImpl(
      prerequisiteCourseId: (json['prerequisiteCourseId'] as num?)?.toInt(),
      courseName: json['courseName'] as String?,
    );

Map<String, dynamic> _$$CoursePrerequisiteImplToJson(
        _$CoursePrerequisiteImpl instance) =>
    <String, dynamic>{
      'prerequisiteCourseId': instance.prerequisiteCourseId,
      'courseName': instance.courseName,
    };
