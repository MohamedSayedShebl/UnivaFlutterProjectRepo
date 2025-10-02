import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_ticket.freezed.dart';
part 'support_ticket.g.dart';

@freezed
class SupportTicket with _$SupportTicket {
  const factory SupportTicket({
    @JsonKey(name: 'ticket_id') required int ticketId,
    @JsonKey(name: 'student_id') int? studentId,
    required String subject,
    required String description,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'resolved_at') String? resolvedAt,
  }) = _SupportTicket;

  factory SupportTicket.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketFromJson(json);
}