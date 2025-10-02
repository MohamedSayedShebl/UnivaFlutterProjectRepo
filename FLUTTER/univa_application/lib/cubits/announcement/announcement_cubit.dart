import 'package:flutter_bloc/flutter_bloc.dart';
import 'announcement_state.dart';
import '../../repositories/announcement_repository.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  final AnnouncementRepository _repository;

  AnnouncementCubit(this._repository) : super(const AnnouncementState.initial());

  Future<void> fetchAnnouncements() async {
    emit(const AnnouncementState.loading());
    final result = await _repository.getAnnouncements();
    result.when(
      success: (announcements) =>
          emit(AnnouncementState.loaded(announcements)),
      failure: (message) => emit(AnnouncementState.error(message)),
    );
  }
  
  Future<void> fetchAnnouncement(int id) async {
    emit(const AnnouncementState.loading());
    final result = await _repository.getAnnouncement(id);
    result.when(
      success: (announcement) => emit(AnnouncementState.detail(announcement)),
      failure: (msg) => emit(AnnouncementState.error(msg)),
    );
  }

  Future<void> createAnnouncement(Map<String, dynamic> data) async {
    emit(const AnnouncementState.loading());
    final result = await _repository.createAnnouncement(data);
    result.when(
      success: (announcement) =>
          emit(AnnouncementState.success(announcement)),
      failure: (message) => emit(AnnouncementState.error(message)),
    );
  }

  Future<void> updateAnnouncement(int id, Map<String, dynamic> data) async {
    final result = await _repository.updateAnnouncement(id, data);
    result.when(
      success: (announcement) => emit(AnnouncementState.success(announcement)),
      failure: (msg) => emit(AnnouncementState.error(msg)),
    );
  }

  Future<void> deleteAnnouncement(int id) async {
    final result = await _repository.deleteAnnouncement(id);
    result.when(
      success: (_) => emit(const AnnouncementState.deleted()),
      failure: (msg) => emit(AnnouncementState.error(msg)),
    );
  }
}