import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_section_state.dart';
import '../../repositories/course_section_repository.dart';

class CourseSectionCubit extends Cubit<CourseSectionState> {
  final CourseSectionRepository _repository;

  CourseSectionCubit(this._repository) : super(const CourseSectionState.initial());

  Future<void> fetchAllSections() async {
    emit(const CourseSectionState.loading());
    final result = await _repository.getAllSections();
    result.when(
      success: (sections) => emit(CourseSectionState.loaded(sections)),
      failure: (message) => emit(CourseSectionState.error(message)),
    );
  }

  Future<void> fetchSection(int id) async {
    emit(const CourseSectionState.loading());
    final result = await _repository.getSectionById(id);
    result.when(
      success: (section) => emit(CourseSectionState.detail(section)),
      failure: (msg) => emit(CourseSectionState.error(msg)),
    );
  }

  Future<void> updateSection(int id, Map<String, dynamic> data) async {
    emit(const CourseSectionState.loading());
    final result = await _repository.updateSection(id, data);
    result.when(
      success: (section) => emit(CourseSectionState.success(section)),
      failure: (msg) => emit(CourseSectionState.error(msg)),
    );
  }

  Future<void> deleteSection(int id) async {
    emit(const CourseSectionState.loading());
    final result = await _repository.deleteSection(id);
    result.when(
      success: (_) => emit(const CourseSectionState.deleted()),
      failure: (msg) => emit(CourseSectionState.error(msg)),
    );
  }

  Future<void> fetchCurrentSections() async {
    emit(const CourseSectionState.loading());
    final result = await _repository.getCurrentSections();
    result.when(
      success: (sections) => emit(CourseSectionState.loaded(sections)),
      failure: (message) => emit(CourseSectionState.error(message)),
    );
  }
}
