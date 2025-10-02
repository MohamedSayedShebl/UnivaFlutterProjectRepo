import 'package:flutter_bloc/flutter_bloc.dart';
import 'enrollment_state.dart';
import '../../repositories/enrollment_repository.dart';

class EnrollmentCubit extends Cubit<EnrollmentState> {
  final EnrollmentRepository _repository;

  EnrollmentCubit(this._repository) : super(const EnrollmentState.initial());

  Future<void> fetchAvailableEnrollments() async {
    emit(const EnrollmentState.loading());
    final result = await _repository.getAvailableEnrollments();
    result.when(
      success: (sections) => emit(EnrollmentState.loadedSections(sections)),
      failure: (msg) => emit(EnrollmentState.error(msg)),
    );
  }

  Future<void> createEnrollments(List<Map<String, dynamic>> enrollments) async {
    emit(const EnrollmentState.loading());
    final result = await _repository.createEnrollments(enrollments);
    result.when(
      success: (enrollments) => emit(EnrollmentState.success(enrollments.first)), // first created enrollment
      failure: (message) => emit(EnrollmentState.error(message)),
    );
  }

  Future<void> updateEnrollments(List<Map<String, dynamic>> enrollments) async {
    emit(const EnrollmentState.loading());
    final result = await _repository.updateEnrollments(enrollments);
    result.when(
      success: (enrollments) => emit(EnrollmentState.loaded(enrollments)),
      failure: (message) => emit(EnrollmentState.error(message)),
    );
  }

  Future<void> fetchAllEnrollments(int studentId) async {
    emit(const EnrollmentState.loading());
    final result = await _repository.getAllEnrollments(studentId);
    result.when(
      success: (enrollments) => emit(EnrollmentState.loaded(enrollments)),
      failure: (message) => emit(EnrollmentState.error(message)),
    );
  }

  Future<void> fetchCurrentEnrollments(int studentId) async {
    emit(const EnrollmentState.loading());
    final result = await _repository.getCurrentEnrollments(studentId);
    result.when(
      success: (enrollments) => emit(EnrollmentState.loaded(enrollments)),
      failure: (message) => emit(EnrollmentState.error(message)),
    );
  }
}
