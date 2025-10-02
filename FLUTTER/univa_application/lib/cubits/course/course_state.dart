import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/course.dart';

part 'course_state.freezed.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;
  const factory CourseState.loading() = _Loading;
  const factory CourseState.loaded(List<Course> courses) = _Loaded;
  const factory CourseState.detail(Course course) = _Detail;
  const factory CourseState.success(Course course) = _Success;
  const factory CourseState.deleted() = _Deleted;
  const factory CourseState.error(String message) = _Error;
}