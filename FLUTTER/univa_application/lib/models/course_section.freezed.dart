// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) {
  return _CourseSection.fromJson(json);
}

/// @nodoc
mixin _$CourseSection {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'courseId')
  int get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'termId')
  int get termId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FacultyId')
  int? get facultyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sectionNumber')
  String get sectionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentEnrollment')
  int? get currentEnrollment => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseSectionCopyWith<CourseSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSectionCopyWith<$Res> {
  factory $CourseSectionCopyWith(
          CourseSection value, $Res Function(CourseSection) then) =
      _$CourseSectionCopyWithImpl<$Res, CourseSection>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'courseId') int courseId,
      @JsonKey(name: 'termId') int termId,
      @JsonKey(name: 'FacultyId') int? facultyId,
      @JsonKey(name: 'sectionNumber') String sectionNumber,
      @JsonKey(name: 'currentEnrollment') int? currentEnrollment,
      String? content});
}

/// @nodoc
class _$CourseSectionCopyWithImpl<$Res, $Val extends CourseSection>
    implements $CourseSectionCopyWith<$Res> {
  _$CourseSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? termId = null,
    Object? facultyId = freezed,
    Object? sectionNumber = null,
    Object? currentEnrollment = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      termId: null == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int,
      facultyId: freezed == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionNumber: null == sectionNumber
          ? _value.sectionNumber
          : sectionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currentEnrollment: freezed == currentEnrollment
          ? _value.currentEnrollment
          : currentEnrollment // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseSectionImplCopyWith<$Res>
    implements $CourseSectionCopyWith<$Res> {
  factory _$$CourseSectionImplCopyWith(
          _$CourseSectionImpl value, $Res Function(_$CourseSectionImpl) then) =
      __$$CourseSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'courseId') int courseId,
      @JsonKey(name: 'termId') int termId,
      @JsonKey(name: 'FacultyId') int? facultyId,
      @JsonKey(name: 'sectionNumber') String sectionNumber,
      @JsonKey(name: 'currentEnrollment') int? currentEnrollment,
      String? content});
}

/// @nodoc
class __$$CourseSectionImplCopyWithImpl<$Res>
    extends _$CourseSectionCopyWithImpl<$Res, _$CourseSectionImpl>
    implements _$$CourseSectionImplCopyWith<$Res> {
  __$$CourseSectionImplCopyWithImpl(
      _$CourseSectionImpl _value, $Res Function(_$CourseSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? termId = null,
    Object? facultyId = freezed,
    Object? sectionNumber = null,
    Object? currentEnrollment = freezed,
    Object? content = freezed,
  }) {
    return _then(_$CourseSectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
      termId: null == termId
          ? _value.termId
          : termId // ignore: cast_nullable_to_non_nullable
              as int,
      facultyId: freezed == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionNumber: null == sectionNumber
          ? _value.sectionNumber
          : sectionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currentEnrollment: freezed == currentEnrollment
          ? _value.currentEnrollment
          : currentEnrollment // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseSectionImpl implements _CourseSection {
  const _$CourseSectionImpl(
      {required this.id,
      @JsonKey(name: 'courseId') required this.courseId,
      @JsonKey(name: 'termId') required this.termId,
      @JsonKey(name: 'FacultyId') this.facultyId,
      @JsonKey(name: 'sectionNumber') required this.sectionNumber,
      @JsonKey(name: 'currentEnrollment') this.currentEnrollment,
      this.content});

  factory _$CourseSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSectionImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'courseId')
  final int courseId;
  @override
  @JsonKey(name: 'termId')
  final int termId;
  @override
  @JsonKey(name: 'FacultyId')
  final int? facultyId;
  @override
  @JsonKey(name: 'sectionNumber')
  final String sectionNumber;
  @override
  @JsonKey(name: 'currentEnrollment')
  final int? currentEnrollment;
  @override
  final String? content;

  @override
  String toString() {
    return 'CourseSection(id: $id, courseId: $courseId, termId: $termId, facultyId: $facultyId, sectionNumber: $sectionNumber, currentEnrollment: $currentEnrollment, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.termId, termId) || other.termId == termId) &&
            (identical(other.facultyId, facultyId) ||
                other.facultyId == facultyId) &&
            (identical(other.sectionNumber, sectionNumber) ||
                other.sectionNumber == sectionNumber) &&
            (identical(other.currentEnrollment, currentEnrollment) ||
                other.currentEnrollment == currentEnrollment) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, termId, facultyId,
      sectionNumber, currentEnrollment, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseSectionImplCopyWith<_$CourseSectionImpl> get copyWith =>
      __$$CourseSectionImplCopyWithImpl<_$CourseSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseSectionImplToJson(
      this,
    );
  }
}

abstract class _CourseSection implements CourseSection {
  const factory _CourseSection(
      {required final int id,
      @JsonKey(name: 'courseId') required final int courseId,
      @JsonKey(name: 'termId') required final int termId,
      @JsonKey(name: 'FacultyId') final int? facultyId,
      @JsonKey(name: 'sectionNumber') required final String sectionNumber,
      @JsonKey(name: 'currentEnrollment') final int? currentEnrollment,
      final String? content}) = _$CourseSectionImpl;

  factory _CourseSection.fromJson(Map<String, dynamic> json) =
      _$CourseSectionImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'courseId')
  int get courseId;
  @override
  @JsonKey(name: 'termId')
  int get termId;
  @override
  @JsonKey(name: 'FacultyId')
  int? get facultyId;
  @override
  @JsonKey(name: 'sectionNumber')
  String get sectionNumber;
  @override
  @JsonKey(name: 'currentEnrollment')
  int? get currentEnrollment;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$CourseSectionImplCopyWith<_$CourseSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
