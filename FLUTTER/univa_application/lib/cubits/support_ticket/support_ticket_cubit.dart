// lib/cubits/support_ticket_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/support_ticket_repository.dart';
import 'support_ticket_state.dart';

class SupportTicketCubit extends Cubit<SupportTicketState> {
  final SupportTicketRepository _repo;

  SupportTicketCubit(this._repo) : super(const SupportTicketState.initial());

  Future<void> fetchTickets() async {
    emit(const SupportTicketState.loading());
    final result = await _repo.fetchTickets();
    result.when(
      success: (data) => emit(SupportTicketState.loadedList(data)),
      failure: (msg) => emit(SupportTicketState.error(msg)),
    );
  }

  Future<void> fetchTicket(int id) async {
    emit(const SupportTicketState.loading());
    final result = await _repo.fetchTicket(id);
    result.when(
      success: (data) => emit(SupportTicketState.loadedSingle(data)),
      failure: (msg) => emit(SupportTicketState.error(msg)),
    );
  }

  Future<void> updateTicket(int id, Map<String, dynamic> body) async {
    emit(const SupportTicketState.loading());
    final result = await _repo.updateTicket(id, body);
    result.when(
      success: (data) => emit(SupportTicketState.loadedSingle(data)),
      failure: (msg) => emit(SupportTicketState.error(msg)),
    );
  }

  Future<void> fetchMyTickets() async {
    emit(const SupportTicketState.loading());
    final result = await _repo.fetchMyTickets();
    result.when(
      success: (data) => emit(SupportTicketState.loadedList(data)),
      failure: (msg) => emit(SupportTicketState.error(msg)),
    );
  }

  Future<void> createTicket(Map<String, dynamic> body) async {
    emit(const SupportTicketState.loading());
    final result = await _repo.createTicket(body);
    result.when(
      success: (data) => emit(SupportTicketState.ticketCreated(data)),
      failure: (msg) => emit(SupportTicketState.error(msg)),
    );
  }
}
