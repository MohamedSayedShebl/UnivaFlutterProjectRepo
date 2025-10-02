import 'package:dio/dio.dart';
import '../models/support_ticket.dart';
import '../core/network/api_services.dart';
import '../core/network/api_result.dart';

class SupportTicketRepository {
  final ApiServices _api;

  SupportTicketRepository(this._api);

  Future<ApiResult<List<SupportTicket>>> fetchTickets() async {
    try {
      final tickets = await _api.getSupportTickets();
      return ApiResult.success(tickets);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['error'] ?? e.message ?? 'Unknown error');
    }
  }

  Future<ApiResult<SupportTicket>> fetchTicket(int id) async {
    try {
      final ticket = await _api.getSupportTicket(id);
      return ApiResult.success(ticket);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['error'] ?? e.message ?? 'Unknown error');
    }
  }

  Future<ApiResult<SupportTicket>> updateTicket(int id, Map<String, dynamic> body) async {
    try {
      final updatedTicket = await _api.updateSupportTicket(id, body);
      return ApiResult.success(updatedTicket);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data['error'] ?? e.message ?? 'Unknown error');
    }
  }

  Future<ApiResult<List<SupportTicket>>> fetchMyTickets() async {
    try {
      final tickets = await _api.getMySupportTickets();
      return ApiResult.success(tickets);
    } on DioException catch (e) {
      return ApiResult.failure(
          e.response?.data['error'] ?? e.message ?? 'Unknown error');
    }
  }

   Future<ApiResult<SupportTicket>> createTicket(Map<String, dynamic> body) async {
    try {
      final ticket = await _api.createSupportTicket(body);
      return ApiResult.success(ticket);
    } on DioException catch (e) {
      return ApiResult.failure(
          e.response?.data['error'] ?? e.message ?? 'Unknown error');
    }
  }

}