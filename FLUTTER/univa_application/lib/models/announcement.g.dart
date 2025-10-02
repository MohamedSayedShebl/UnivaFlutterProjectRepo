// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementImpl _$$AnnouncementImplFromJson(Map<String, dynamic> json) =>
    _$AnnouncementImpl(
      announcement_id: (json['announcement_id'] as num?)?.toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      author_id: (json['author_id'] as num?)?.toInt(),
      course_section_id: (json['course_section_id'] as num?)?.toInt(),
      is_published: json['is_published'] as bool?,
    );

Map<String, dynamic> _$$AnnouncementImplToJson(_$AnnouncementImpl instance) =>
    <String, dynamic>{
      'announcement_id': instance.announcement_id,
      'title': instance.title,
      'content': instance.content,
      'author_id': instance.author_id,
      'course_section_id': instance.course_section_id,
      'is_published': instance.is_published,
    };
