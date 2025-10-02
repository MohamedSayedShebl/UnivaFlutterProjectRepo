import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/course_repository.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepo _repo;
  CourseCubit(this._repo) : super(const CourseState.initial());

  Future<void> fetchCourses() async {
    emit(const CourseState.loading());
    final result = await _repo.fetchCourses();
    result.when(
      success: (data) => emit(CourseState.loaded(data)),
      failure: (msg) => emit(CourseState.error(msg)),
    );
  }

  Future<void> fetchCourse(int id) async {
    emit(const CourseState.loading());
    final result = await _repo.fetchCourse(id);
    result.when(
      success: (data) => emit(CourseState.detail(data)),
      failure: (msg) => emit(CourseState.error(msg)),
    );
  }

  Future<void> createCourse(Map<String, dynamic> payload) async {
    emit(const CourseState.loading());
    final result = await _repo.createCourse(payload);
    result.when(
      success: (data) => emit(CourseState.success(data)),
      failure: (msg) => emit(CourseState.error(msg)),
    );
  }

  Future<void> updateCourse(int id, Map<String, dynamic> payload) async {
    emit(const CourseState.loading());
    final result = await _repo.updateCourse(id, payload);
    result.when(
      success: (data) => emit(CourseState.success(data)),
      failure: (msg) => emit(CourseState.error(msg)),
    );
  }

  Future<void> deleteCourse(int id) async {
    emit(const CourseState.loading());
    final result = await _repo.deleteCourse(id);
    result.when(
      success: (_) => emit(const CourseState.deleted()),
      failure: (msg) => emit(CourseState.error(msg)),
    );
  }
}