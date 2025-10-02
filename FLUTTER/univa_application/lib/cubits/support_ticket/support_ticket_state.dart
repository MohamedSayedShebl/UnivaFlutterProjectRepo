import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:univa_application/models/support_ticket.dart';

part 'support_ticket_state.freezed.dart';

@freezed
class SupportTicketState with _$SupportTicketState {
  const factory SupportTicketState.initial() = _Initial;
  const factory SupportTicketState.loading() = _Loading;
  const factory SupportTicketState.loadedList(List<SupportTicket> tickets) = _LoadedList;
  const factory SupportTicketState.loadedSingle(SupportTicket ticket) = _LoadedSingle;
  const factory SupportTicketState.ticketCreated(SupportTicket ticket) = _ticketCreated;
  const factory SupportTicketState.success(SupportTicket ticket) = _Success;
  const factory SupportTicketState.error(String message) = _Error;
}
