// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailableSection _$AvailableSectionFromJson(Map<String, dynamic> json) {
  return _AvailableSection.fromJson(json);
}

/// @nodoc
mixin _$AvailableSection {
  @JsonKey(name: 'section_id')
  int get sectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_id')
  int? get termId => throw _privateConstructorUsedError;
  @JsonKey(name: 'faculty_id')
  int? get facultyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'section_number')
  String? get sectionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_enrollment')
  int? get currentEnrollment => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableSectionCopyWith<AvailableSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableSectionCopyWith<$Res> {
  factory $AvailableSectionCopyWith(
          AvailableSection value, $Res Function(AvailableSection) then) =
      _$AvailableSectionCopyWithImpl<$Res, AvailableSection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'section_id') int sectionId,
      @JsonKey(name: 'course_id') int? courseId,
      @JsonKey(name: 'term_id') int? termId,
      @JsonKey(name: 'faculty_id') int? facultyId,
      @JsonKey(name: 'section_number') String? sectionNumber,
      @JsonKey(name: 'current_enrollment') int? currentEnrollment,
      Course? course});

  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$AvailableSectionCopyWithImpl<$Res, $Val extends AvailableSection>
    implements $AvailableSectionCopyWith<$Res> {
  _$AvailableSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? courseId = freezed,
    Object? termId = freezed,
    Object? facultyId = freezed,
    Object? sectionNumber = freezed,
    Object? currentEnrollment = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      termId: freezed == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int?,
      facultyId: freezed == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionNumber: freezed == sectionNumber
          ? _value.sectionNumber
          : sectionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentEnrollment: freezed == currentEnrollment
          ? _value.currentEnrollment
          : currentEnrollment // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvailableSectionImplCopyWith<$Res>
    implements $AvailableSectionCopyWith<$Res> {
  factory _$$AvailableSectionImplCopyWith(_$AvailableSectionImpl value,
          $Res Function(_$AvailableSectionImpl) then) =
      __$$AvailableSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'section_id') int sectionId,
      @JsonKey(name: 'course_id') int? courseId,
      @JsonKey(name: 'term_id') int? termId,
      @JsonKey(name: 'faculty_id') int? facultyId,
      @JsonKey(name: 'section_number') String? sectionNumber,
      @JsonKey(name: 'current_enrollment') int? currentEnrollment,
      Course? course});

  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$AvailableSectionImplCopyWithImpl<$Res>
    extends _$AvailableSectionCopyWithImpl<$Res, _$AvailableSectionImpl>
    implements _$$AvailableSectionImplCopyWith<$Res> {
  __$$AvailableSectionImplCopyWithImpl(_$AvailableSectionImpl _value,
      $Res Function(_$AvailableSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = null,
    Object? courseId = freezed,
    Object? termId = freezed,
    Object? facultyId = freezed,
    Object? sectionNumber = freezed,
    Object? currentEnrollment = freezed,
    Object? course = freezed,
  }) {
    return _then(_$AvailableSectionImpl(
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      termId: freezed == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int?,
      facultyId: freezed == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionNumber: freezed == sectionNumber
          ? _value.sectionNumber
          : sectionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      currentEnrollment: freezed == currentEnrollment
          ? _value.currentEnrollment
          : currentEnrollment // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableSectionImpl implements _AvailableSection {
  const _$AvailableSectionImpl(
      {@JsonKey(name: 'section_id') required this.sectionId,
      @JsonKey(name: 'course_id') this.courseId,
      @JsonKey(name: 'term_id') this.termId,
      @JsonKey(name: 'faculty_id') this.facultyId,
      @JsonKey(name: 'section_number') this.sectionNumber,
      @JsonKey(name: 'current_enrollment') this.currentEnrollment,
      this.course});

  factory _$AvailableSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableSectionImplFromJson(json);

  @override
  @JsonKey(name: 'section_id')
  final int sectionId;
  @override
  @JsonKey(name: 'course_id')
  final int? courseId;
  @override
  @JsonKey(name: 'term_id')
  final int? termId;
  @override
  @JsonKey(name: 'faculty_id')
  final int? facultyId;
  @override
  @JsonKey(name: 'section_number')
  final String? sectionNumber;
  @override
  @JsonKey(name: 'current_enrollment')
  final int? currentEnrollment;
  @override
  final Course? course;

  @override
  String toString() {
    return 'AvailableSection(sectionId: $sectionId, courseId: $courseId, termId: $termId, facultyId: $facultyId, sectionNumber: $sectionNumber, currentEnrollment: $currentEnrollment, course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableSectionImpl &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.termId, termId) || other.termId == termId) &&
            (identical(other.facultyId, facultyId) ||
                other.facultyId == facultyId) &&
            (identical(other.sectionNumber, sectionNumber) ||
                other.sectionNumber == sectionNumber) &&
            (identical(other.currentEnrollment, currentEnrollment) ||
                other.currentEnrollment == currentEnrollment) &&
            (identical(other.course, course) || other.course == course));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sectionId, courseId, termId,
      facultyId, sectionNumber, currentEnrollment, course);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableSectionImplCopyWith<_$AvailableSectionImpl> get copyWith =>
      __$$AvailableSectionImplCopyWithImpl<_$AvailableSectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableSectionImplToJson(
      this,
    );
  }
}

abstract class _AvailableSection implements AvailableSection {
  const factory _AvailableSection(
      {@JsonKey(name: 'section_id') required final int sectionId,
      @JsonKey(name: 'course_id') final int? courseId,
      @JsonKey(name: 'term_id') final int? termId,
      @JsonKey(name: 'faculty_id') final int? facultyId,
      @JsonKey(name: 'section_number') final String? sectionNumber,
      @JsonKey(name: 'current_enrollment') final int? currentEnrollment,
      final Course? course}) = _$AvailableSectionImpl;

  factory _AvailableSection.fromJson(Map<String, dynamic> json) =
      _$AvailableSectionImpl.fromJson;

  @override
  @JsonKey(name: 'section_id')
  int get sectionId;
  @override
  @JsonKey(name: 'course_id')
  int? get courseId;
  @override
  @JsonKey(name: 'term_id')
  int? get termId;
  @override
  @JsonKey(name: 'faculty_id')
  int? get facultyId;
  @override
  @JsonKey(name: 'section_number')
  String? get sectionNumber;
  @override
  @JsonKey(name: 'current_enrollment')
  int? get currentEnrollment;
  @override
  Course? get course;
  @override
  @JsonKey(ignore: true)
  _$$AvailableSectionImplCopyWith<_$AvailableSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
