// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      studentId: (json['student_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      currentGpa: (json['current_gpa'] as num?)?.toDouble(),
      totalCredits: (json['total_credits'] as num?)?.toInt(),
      level: json['level'] as String?,
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'user_id': instance.userId,
      'phone': instance.phone,
      'address': instance.address,
      'current_gpa': instance.currentGpa,
      'total_credits': instance.totalCredits,
      'level': instance.level,
    };
