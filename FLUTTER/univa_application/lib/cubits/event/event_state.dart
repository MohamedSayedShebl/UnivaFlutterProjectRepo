// cubits/event/event_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/event.dart';

part 'event_state.freezed.dart';

// cubits/event/event_state.dart
@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _Loading;
  const factory EventState.loaded(List<Event> events) = _Loaded;
  const factory EventState.detail(Event event) = _Detail;
  const factory EventState.success(Event event) = _Success;
  const factory EventState.deleted() = _Deleted;
  const factory EventState.error(String message) = _Error;
}