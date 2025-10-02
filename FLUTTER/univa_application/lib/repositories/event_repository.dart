import 'package:dio/dio.dart';
import '../models/event.dart';
import '../core/network/api_services.dart';
import '../core/network/api_result.dart';

class EventRepository {
  final ApiServices _api;

  EventRepository(this._api);

  Future<ApiResult<List<Event>>> getEvents() async {
    try {
      final events = await _api.getEvents();
      return ApiResult.success(events);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Event>> createEvent(Map<String, dynamic> data) async {
    try {
      final event = await _api.createEvent(data);
      return ApiResult.success(event);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Event>> getEvent(int id) async {
  try {
    final event = await _api.getEvent(id);
    return ApiResult.success(event);
  } on DioException catch (e) {
    final serverMsg = e.response?.data ?? e.message;
    return ApiResult.failure(serverMsg.toString());
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

Future<ApiResult<Event>> updateEvent(int id, Map<String, dynamic> data) async {
  try {
    final event = await _api.updateEvent(id, data);
    return ApiResult.success(event);
  } on DioException catch (e) {
    final serverMsg = e.response?.data ?? e.message;
    return ApiResult.failure(serverMsg.toString());
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

Future<ApiResult<void>> deleteEvent(int id) async {
  try {
    await _api.deleteEvent(id);
    return const ApiResult.success(null);
  } on DioException catch (e) {
    final serverMsg = e.response?.data ?? e.message;
    return ApiResult.failure(serverMsg.toString());
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

}
