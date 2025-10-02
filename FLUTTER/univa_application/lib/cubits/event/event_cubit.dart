import 'package:flutter_bloc/flutter_bloc.dart';
import 'event_state.dart';
import '../../repositories/event_repository.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _repository;

  EventCubit(this._repository) : super(const EventState.initial());

  Future<void> fetchEvents() async {
    emit(const EventState.loading());
    final result = await _repository.getEvents();
    result.when(
      success: (events) => emit(EventState.loaded(events)),
      failure: (message) => emit(EventState.error(message)),
    );
  }

  Future<void> createEvent(Map<String, dynamic> data) async {
    emit(const EventState.loading());
    final result = await _repository.createEvent(data);
    result.when(
      success: (event) => emit(EventState.success(event)),
      failure: (message) => emit(EventState.error(message)),
    );
  }

   Future<void> fetchEvent(int id) async {
    emit(const EventState.loading());
    final result = await _repository.getEvent(id);
    result.when(
      success: (event) => emit(EventState.detail(event)),
      failure: (msg) => emit(EventState.error(msg)),
    );
  }

  Future<void> updateEvent(int id, Map<String, dynamic> data) async {
    emit(const EventState.loading());
    final result = await _repository.updateEvent(id, data);
    result.when(
      success: (event) => emit(EventState.success(event)),
      failure: (msg) => emit(EventState.error(msg)),
    );
  }

  Future<void> deleteEvent(int id) async {
    emit(const EventState.loading());
    final result = await _repository.deleteEvent(id);
    result.when(
      success: (_) => emit(const EventState.deleted()),
      failure: (msg) => emit(EventState.error(msg)),
    );
  }
}