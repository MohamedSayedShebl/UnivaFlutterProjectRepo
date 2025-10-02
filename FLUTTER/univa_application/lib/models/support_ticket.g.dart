// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportTicketImpl _$$SupportTicketImplFromJson(Map<String, dynamic> json) =>
    _$SupportTicketImpl(
      ticketId: (json['ticket_id'] as num).toInt(),
      studentId: (json['student_id'] as num?)?.toInt(),
      subject: json['subject'] as String,
      description: json['description'] as String,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      resolvedAt: json['resolved_at'] as String?,
    );

Map<String, dynamic> _$$SupportTicketImplToJson(_$SupportTicketImpl instance) =>
    <String, dynamic>{
      'ticket_id': instance.ticketId,
      'student_id': instance.studentId,
      'subject': instance.subject,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt,
      'resolved_at': instance.resolvedAt,
    };
