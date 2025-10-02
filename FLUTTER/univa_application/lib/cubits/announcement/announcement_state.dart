// cubits/announcement/announcement_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/announcement.dart';

part 'announcement_state.freezed.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState.initial() = _Initial;
  const factory AnnouncementState.loading() = _Loading;
  const factory AnnouncementState.success(Announcement announcement) = _Success;
    const factory AnnouncementState.detail(Announcement announcement) = _Detail;
  const factory AnnouncementState.loaded(List<Announcement> announcements) = _Loaded;
    const factory AnnouncementState.deleted() = _Deleted;
  const factory AnnouncementState.error(String message) = _Error;
}