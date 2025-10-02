// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  @JsonKey(name: 'course_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_name')
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_code')
  String? get courseCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_hours')
  int? get creditHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get is_active => throw _privateConstructorUsedError;
  List<dynamic>? get prerequisites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {@JsonKey(name: 'course_id') int? id,
      @JsonKey(name: 'course_name') String? courseName,
      @JsonKey(name: 'course_code') String? courseCode,
      String? description,
      @JsonKey(name: 'credit_hours') int? creditHours,
      @JsonKey(name: 'is_active') bool? is_active,
      List<dynamic>? prerequisites});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseName = freezed,
    Object? courseCode = freezed,
    Object? description = freezed,
    Object? creditHours = freezed,
    Object? is_active = freezed,
    Object? prerequisites = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseCode: freezed == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      creditHours: freezed == creditHours
          ? _value.creditHours
          : creditHours // ignore: cast_nullable_to_non_nullable
              as int?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      prerequisites: freezed == prerequisites
          ? _value.prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
          _$CourseImpl value, $Res Function(_$CourseImpl) then) =
      __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'course_id') int? id,
      @JsonKey(name: 'course_name') String? courseName,
      @JsonKey(name: 'course_code') String? courseCode,
      String? description,
      @JsonKey(name: 'credit_hours') int? creditHours,
      @JsonKey(name: 'is_active') bool? is_active,
      List<dynamic>? prerequisites});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
      _$CourseImpl _value, $Res Function(_$CourseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseName = freezed,
    Object? courseCode = freezed,
    Object? description = freezed,
    Object? creditHours = freezed,
    Object? is_active = freezed,
    Object? prerequisites = freezed,
  }) {
    return _then(_$CourseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseCode: freezed == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      creditHours: freezed == creditHours
          ? _value.creditHours
          : creditHours // ignore: cast_nullable_to_non_nullable
              as int?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      prerequisites: freezed == prerequisites
          ? _value._prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  const _$CourseImpl(
      {@JsonKey(name: 'course_id') required this.id,
      @JsonKey(name: 'course_name') this.courseName,
      @JsonKey(name: 'course_code') required this.courseCode,
      this.description,
      @JsonKey(name: 'credit_hours') this.creditHours,
      @JsonKey(name: 'is_active') this.is_active,
      final List<dynamic>? prerequisites})
      : _prerequisites = prerequisites;

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  @JsonKey(name: 'course_id')
  final int? id;
  @override
  @JsonKey(name: 'course_name')
  final String? courseName;
  @override
  @JsonKey(name: 'course_code')
  final String? courseCode;
  @override
  final String? description;
  @override
  @JsonKey(name: 'credit_hours')
  final int? creditHours;
  @override
  @JsonKey(name: 'is_active')
  final bool? is_active;
  final List<dynamic>? _prerequisites;
  @override
  List<dynamic>? get prerequisites {
    final value = _prerequisites;
    if (value == null) return null;
    if (_prerequisites is EqualUnmodifiableListView) return _prerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Course(id: $id, courseName: $courseName, courseCode: $courseCode, description: $description, creditHours: $creditHours, is_active: $is_active, prerequisites: $prerequisites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.creditHours, creditHours) ||
                other.creditHours == creditHours) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            const DeepCollectionEquality()
                .equals(other._prerequisites, _prerequisites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courseName,
      courseCode,
      description,
      creditHours,
      is_active,
      const DeepCollectionEquality().hash(_prerequisites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {@JsonKey(name: 'course_id') required final int? id,
      @JsonKey(name: 'course_name') final String? courseName,
      @JsonKey(name: 'course_code') required final String? courseCode,
      final String? description,
      @JsonKey(name: 'credit_hours') final int? creditHours,
      @JsonKey(name: 'is_active') final bool? is_active,
      final List<dynamic>? prerequisites}) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  @JsonKey(name: 'course_id')
  int? get id;
  @override
  @JsonKey(name: 'course_name')
  String? get courseName;
  @override
  @JsonKey(name: 'course_code')
  String? get courseCode;
  @override
  String? get description;
  @override
  @JsonKey(name: 'credit_hours')
  int? get creditHours;
  @override
  @JsonKey(name: 'is_active')
  bool? get is_active;
  @override
  List<dynamic>? get prerequisites;
  @override
  @JsonKey(ignore: true)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
