import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/course_section.dart';

part 'course_section_state.freezed.dart';

@freezed
class CourseSectionState with _$CourseSectionState {
  const factory CourseSectionState.initial() = _Initial;
  const factory CourseSectionState.loading() = _Loading;
  const factory CourseSectionState.loaded(List<CourseSection> sections) = _Loaded;
  const factory CourseSectionState.detail(CourseSection section) = _Detail;
  const factory CourseSectionState.success(CourseSection section) = _Success;
  const factory CourseSectionState.deleted() = _Deleted;
  const factory CourseSectionState.error(String message) = _Error;
}
