import 'package:dio/dio.dart';
import '../models/announcement.dart';
import '../core/network/api_services.dart';
import '../core/network/api_result.dart';

class AnnouncementRepository {
  final ApiServices _api;

  AnnouncementRepository(this._api);

  Future<ApiResult<List<Announcement>>> getAnnouncements() async {
    try {
      final announcements = await _api.getAnnouncements();
      return ApiResult.success(announcements);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Announcement>> getAnnouncement(int id) async {
    try {
      final res = await _api.getAnnouncement(id);
      final announcement = Announcement.fromJson(res.data);
      return ApiResult.success(announcement);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Announcement>> updateAnnouncement(int id, Map<String, dynamic> data) async {
    try {
      final res = await _api.updateAnnouncement(id, data);
      final announcement = Announcement.fromJson(res.data);
      return ApiResult.success(announcement);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> deleteAnnouncement(int id) async {
    try {
      await _api.deleteAnnouncement(id);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<Announcement>> createAnnouncement(Map<String, dynamic> data) async {
    try {
      final announcement = await _api.createAnnouncement(data);
      return ApiResult.success(announcement);
    } on DioException catch (e) {
      final serverMsg = e.response?.data ?? e.message;
      return ApiResult.failure(serverMsg.toString());
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
