import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/available_section.dart';
import '../../models/enrollment.dart';

part 'enrollment_state.freezed.dart';

@freezed
class EnrollmentState with _$EnrollmentState {
  const factory EnrollmentState.initial() = _Initial;
  const factory EnrollmentState.loading() = _Loading;
  const factory EnrollmentState.loaded(List<Enrollment> enrollments) = _Loaded;
  const factory EnrollmentState.detail(Enrollment enrollment) = _Detail;
  const factory EnrollmentState.success(Enrollment enrollment) = _Success;
   const factory EnrollmentState.loadedSections(List<AvailableSection> sections) = _LoadedSections;
  const factory EnrollmentState.deleted() = _Deleted;
  const factory EnrollmentState.error(String message) = _Error;
}
