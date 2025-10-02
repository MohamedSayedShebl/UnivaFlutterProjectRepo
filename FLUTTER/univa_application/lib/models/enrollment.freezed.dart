// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) {
  return _Enrollment.fromJson(json);
}

/// @nodoc
mixin _$Enrollment {
  int? get enrollmentId => throw _privateConstructorUsedError;
  int? get studentId => throw _privateConstructorUsedError;
  int? get sectionId => throw _privateConstructorUsedError;
  DateTime? get enrollmentDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get finalGrade => throw _privateConstructorUsedError;
  int? get result => throw _privateConstructorUsedError;
  CourseSectionInfo? get section => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnrollmentCopyWith<Enrollment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentCopyWith<$Res> {
  factory $EnrollmentCopyWith(
          Enrollment value, $Res Function(Enrollment) then) =
      _$EnrollmentCopyWithImpl<$Res, Enrollment>;
  @useResult
  $Res call(
      {int? enrollmentId,
      int? studentId,
      int? sectionId,
      DateTime? enrollmentDate,
      String? status,
      String? finalGrade,
      int? result,
      CourseSectionInfo? section});

  $CourseSectionInfoCopyWith<$Res>? get section;
}

/// @nodoc
class _$EnrollmentCopyWithImpl<$Res, $Val extends Enrollment>
    implements $EnrollmentCopyWith<$Res> {
  _$EnrollmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? sectionId = freezed,
    Object? enrollmentDate = freezed,
    Object? status = freezed,
    Object? finalGrade = freezed,
    Object? result = freezed,
    Object? section = freezed,
  }) {
    return _then(_value.copyWith(
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentDate: freezed == enrollmentDate
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      finalGrade: freezed == finalGrade
          ? _value.finalGrade
          : finalGrade // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as CourseSectionInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseSectionInfoCopyWith<$Res>? get section {
    if (_value.section == null) {
      return null;
    }

    return $CourseSectionInfoCopyWith<$Res>(_value.section!, (value) {
      return _then(_value.copyWith(section: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnrollmentImplCopyWith<$Res>
    implements $EnrollmentCopyWith<$Res> {
  factory _$$EnrollmentImplCopyWith(
          _$EnrollmentImpl value, $Res Function(_$EnrollmentImpl) then) =
      __$$EnrollmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? enrollmentId,
      int? studentId,
      int? sectionId,
      DateTime? enrollmentDate,
      String? status,
      String? finalGrade,
      int? result,
      CourseSectionInfo? section});

  @override
  $CourseSectionInfoCopyWith<$Res>? get section;
}

/// @nodoc
class __$$EnrollmentImplCopyWithImpl<$Res>
    extends _$EnrollmentCopyWithImpl<$Res, _$EnrollmentImpl>
    implements _$$EnrollmentImplCopyWith<$Res> {
  __$$EnrollmentImplCopyWithImpl(
      _$EnrollmentImpl _value, $Res Function(_$EnrollmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? sectionId = freezed,
    Object? enrollmentDate = freezed,
    Object? status = freezed,
    Object? finalGrade = freezed,
    Object? result = freezed,
    Object? section = freezed,
  }) {
    return _then(_$EnrollmentImpl(
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentDate: freezed == enrollmentDate
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      finalGrade: freezed == finalGrade
          ? _value.finalGrade
          : finalGrade // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as CourseSectionInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentImpl implements _Enrollment {
  const _$EnrollmentImpl(
      {required this.enrollmentId,
      required this.studentId,
      required this.sectionId,
      this.enrollmentDate,
      this.status,
      this.finalGrade,
      this.result,
      this.section});

  factory _$EnrollmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentImplFromJson(json);

  @override
  final int? enrollmentId;
  @override
  final int? studentId;
  @override
  final int? sectionId;
  @override
  final DateTime? enrollmentDate;
  @override
  final String? status;
  @override
  final String? finalGrade;
  @override
  final int? result;
  @override
  final CourseSectionInfo? section;

  @override
  String toString() {
    return 'Enrollment(enrollmentId: $enrollmentId, studentId: $studentId, sectionId: $sectionId, enrollmentDate: $enrollmentDate, status: $status, finalGrade: $finalGrade, result: $result, section: $section)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentImpl &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.enrollmentDate, enrollmentDate) ||
                other.enrollmentDate == enrollmentDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.finalGrade, finalGrade) ||
                other.finalGrade == finalGrade) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.section, section) || other.section == section));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enrollmentId, studentId,
      sectionId, enrollmentDate, status, finalGrade, result, section);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      __$$EnrollmentImplCopyWithImpl<_$EnrollmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentImplToJson(
      this,
    );
  }
}

abstract class _Enrollment implements Enrollment {
  const factory _Enrollment(
      {required final int? enrollmentId,
      required final int? studentId,
      required final int? sectionId,
      final DateTime? enrollmentDate,
      final String? status,
      final String? finalGrade,
      final int? result,
      final CourseSectionInfo? section}) = _$EnrollmentImpl;

  factory _Enrollment.fromJson(Map<String, dynamic> json) =
      _$EnrollmentImpl.fromJson;

  @override
  int? get enrollmentId;
  @override
  int? get studentId;
  @override
  int? get sectionId;
  @override
  DateTime? get enrollmentDate;
  @override
  String? get status;
  @override
  String? get finalGrade;
  @override
  int? get result;
  @override
  CourseSectionInfo? get section;
  @override
  @JsonKey(ignore: true)
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseSectionInfo _$CourseSectionInfoFromJson(Map<String, dynamic> json) {
  return _CourseSectionInfo.fromJson(json);
}

/// @nodoc
mixin _$CourseSectionInfo {
  int? get sectionId => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  int? get termId => throw _privateConstructorUsedError;
  int? get facultyId => throw _privateConstructorUsedError;
  String? get sectionNumber => throw _privateConstructorUsedError;
  int? get currentEnrollment => throw _privateConstructorUsedError;
  CourseInfo? get course => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseSectionInfoCopyWith<CourseSectionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSectionInfoCopyWith<$Res> {
  factory $CourseSectionInfoCopyWith(
          CourseSectionInfo value, $Res Function(CourseSectionInfo) then) =
      _$CourseSectionInfoCopyWithImpl<$Res, CourseSectionInfo>;
  @useResult
  $Res call(
      {int? sectionId,
      int? courseId,
      int? termId,
      int? facultyId,
      String? sectionNumber,
      int? currentEnrollment,
      CourseInfo? course});

  $CourseInfoCopyWith<$Res>? get course;
}

/// @nodoc
class _$CourseSectionInfoCopyWithImpl<$Res, $Val extends CourseSectionInfo>
    implements $CourseSectionInfoCopyWith<$Res> {
  _$CourseSectionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = freezed,
    Object? courseId = freezed,
    Object? termId = freezed,
    Object? facultyId = freezed,
    Object? sectionNumber = freezed,
    Object? currentEnrollment = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as CourseInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseInfoCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseInfoCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseSectionInfoImplCopyWith<$Res>
    implements $CourseSectionInfoCopyWith<$Res> {
  factory _$$CourseSectionInfoImplCopyWith(_$CourseSectionInfoImpl value,
          $Res Function(_$CourseSectionInfoImpl) then) =
      __$$CourseSectionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? sectionId,
      int? courseId,
      int? termId,
      int? facultyId,
      String? sectionNumber,
      int? currentEnrollment,
      CourseInfo? course});

  @override
  $CourseInfoCopyWith<$Res>? get course;
}

/// @nodoc
class __$$CourseSectionInfoImplCopyWithImpl<$Res>
    extends _$CourseSectionInfoCopyWithImpl<$Res, _$CourseSectionInfoImpl>
    implements _$$CourseSectionInfoImplCopyWith<$Res> {
  __$$CourseSectionInfoImplCopyWithImpl(_$CourseSectionInfoImpl _value,
      $Res Function(_$CourseSectionInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionId = freezed,
    Object? courseId = freezed,
    Object? termId = freezed,
    Object? facultyId = freezed,
    Object? sectionNumber = freezed,
    Object? currentEnrollment = freezed,
    Object? course = freezed,
  }) {
    return _then(_$CourseSectionInfoImpl(
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as CourseInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseSectionInfoImpl implements _CourseSectionInfo {
  const _$CourseSectionInfoImpl(
      {required this.sectionId,
      required this.courseId,
      required this.termId,
      this.facultyId,
      this.sectionNumber,
      this.currentEnrollment,
      this.course});

  factory _$CourseSectionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSectionInfoImplFromJson(json);

  @override
  final int? sectionId;
  @override
  final int? courseId;
  @override
  final int? termId;
  @override
  final int? facultyId;
  @override
  final String? sectionNumber;
  @override
  final int? currentEnrollment;
  @override
  final CourseInfo? course;

  @override
  String toString() {
    return 'CourseSectionInfo(sectionId: $sectionId, courseId: $courseId, termId: $termId, facultyId: $facultyId, sectionNumber: $sectionNumber, currentEnrollment: $currentEnrollment, course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseSectionInfoImpl &&
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
  _$$CourseSectionInfoImplCopyWith<_$CourseSectionInfoImpl> get copyWith =>
      __$$CourseSectionInfoImplCopyWithImpl<_$CourseSectionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseSectionInfoImplToJson(
      this,
    );
  }
}

abstract class _CourseSectionInfo implements CourseSectionInfo {
  const factory _CourseSectionInfo(
      {required final int? sectionId,
      required final int? courseId,
      required final int? termId,
      final int? facultyId,
      final String? sectionNumber,
      final int? currentEnrollment,
      final CourseInfo? course}) = _$CourseSectionInfoImpl;

  factory _CourseSectionInfo.fromJson(Map<String, dynamic> json) =
      _$CourseSectionInfoImpl.fromJson;

  @override
  int? get sectionId;
  @override
  int? get courseId;
  @override
  int? get termId;
  @override
  int? get facultyId;
  @override
  String? get sectionNumber;
  @override
  int? get currentEnrollment;
  @override
  CourseInfo? get course;
  @override
  @JsonKey(ignore: true)
  _$$CourseSectionInfoImplCopyWith<_$CourseSectionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) {
  return _CourseInfo.fromJson(json);
}

/// @nodoc
mixin _$CourseInfo {
  int? get courseId => throw _privateConstructorUsedError;
  String? get courseCode => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get creditHours => throw _privateConstructorUsedError;
  List<CoursePrerequisite>? get coursePrerequisites =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseInfoCopyWith<CourseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseInfoCopyWith<$Res> {
  factory $CourseInfoCopyWith(
          CourseInfo value, $Res Function(CourseInfo) then) =
      _$CourseInfoCopyWithImpl<$Res, CourseInfo>;
  @useResult
  $Res call(
      {int? courseId,
      String? courseCode,
      String? courseName,
      String? description,
      int? creditHours,
      List<CoursePrerequisite>? coursePrerequisites});
}

/// @nodoc
class _$CourseInfoCopyWithImpl<$Res, $Val extends CourseInfo>
    implements $CourseInfoCopyWith<$Res> {
  _$CourseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = freezed,
    Object? courseCode = freezed,
    Object? courseName = freezed,
    Object? description = freezed,
    Object? creditHours = freezed,
    Object? coursePrerequisites = freezed,
  }) {
    return _then(_value.copyWith(
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseCode: freezed == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      creditHours: freezed == creditHours
          ? _value.creditHours
          : creditHours // ignore: cast_nullable_to_non_nullable
              as int?,
      coursePrerequisites: freezed == coursePrerequisites
          ? _value.coursePrerequisites
          : coursePrerequisites // ignore: cast_nullable_to_non_nullable
              as List<CoursePrerequisite>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseInfoImplCopyWith<$Res>
    implements $CourseInfoCopyWith<$Res> {
  factory _$$CourseInfoImplCopyWith(
          _$CourseInfoImpl value, $Res Function(_$CourseInfoImpl) then) =
      __$$CourseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? courseId,
      String? courseCode,
      String? courseName,
      String? description,
      int? creditHours,
      List<CoursePrerequisite>? coursePrerequisites});
}

/// @nodoc
class __$$CourseInfoImplCopyWithImpl<$Res>
    extends _$CourseInfoCopyWithImpl<$Res, _$CourseInfoImpl>
    implements _$$CourseInfoImplCopyWith<$Res> {
  __$$CourseInfoImplCopyWithImpl(
      _$CourseInfoImpl _value, $Res Function(_$CourseInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = freezed,
    Object? courseCode = freezed,
    Object? courseName = freezed,
    Object? description = freezed,
    Object? creditHours = freezed,
    Object? coursePrerequisites = freezed,
  }) {
    return _then(_$CourseInfoImpl(
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseCode: freezed == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      creditHours: freezed == creditHours
          ? _value.creditHours
          : creditHours // ignore: cast_nullable_to_non_nullable
              as int?,
      coursePrerequisites: freezed == coursePrerequisites
          ? _value._coursePrerequisites
          : coursePrerequisites // ignore: cast_nullable_to_non_nullable
              as List<CoursePrerequisite>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseInfoImpl implements _CourseInfo {
  const _$CourseInfoImpl(
      {required this.courseId,
      required this.courseCode,
      required this.courseName,
      this.description,
      this.creditHours,
      final List<CoursePrerequisite>? coursePrerequisites})
      : _coursePrerequisites = coursePrerequisites;

  factory _$CourseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseInfoImplFromJson(json);

  @override
  final int? courseId;
  @override
  final String? courseCode;
  @override
  final String? courseName;
  @override
  final String? description;
  @override
  final int? creditHours;
  final List<CoursePrerequisite>? _coursePrerequisites;
  @override
  List<CoursePrerequisite>? get coursePrerequisites {
    final value = _coursePrerequisites;
    if (value == null) return null;
    if (_coursePrerequisites is EqualUnmodifiableListView)
      return _coursePrerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CourseInfo(courseId: $courseId, courseCode: $courseCode, courseName: $courseName, description: $description, creditHours: $creditHours, coursePrerequisites: $coursePrerequisites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseInfoImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.creditHours, creditHours) ||
                other.creditHours == creditHours) &&
            const DeepCollectionEquality()
                .equals(other._coursePrerequisites, _coursePrerequisites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      courseId,
      courseCode,
      courseName,
      description,
      creditHours,
      const DeepCollectionEquality().hash(_coursePrerequisites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseInfoImplCopyWith<_$CourseInfoImpl> get copyWith =>
      __$$CourseInfoImplCopyWithImpl<_$CourseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseInfoImplToJson(
      this,
    );
  }
}

abstract class _CourseInfo implements CourseInfo {
  const factory _CourseInfo(
      {required final int? courseId,
      required final String? courseCode,
      required final String? courseName,
      final String? description,
      final int? creditHours,
      final List<CoursePrerequisite>? coursePrerequisites}) = _$CourseInfoImpl;

  factory _CourseInfo.fromJson(Map<String, dynamic> json) =
      _$CourseInfoImpl.fromJson;

  @override
  int? get courseId;
  @override
  String? get courseCode;
  @override
  String? get courseName;
  @override
  String? get description;
  @override
  int? get creditHours;
  @override
  List<CoursePrerequisite>? get coursePrerequisites;
  @override
  @JsonKey(ignore: true)
  _$$CourseInfoImplCopyWith<_$CourseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoursePrerequisite _$CoursePrerequisiteFromJson(Map<String, dynamic> json) {
  return _CoursePrerequisite.fromJson(json);
}

/// @nodoc
mixin _$CoursePrerequisite {
  int? get prerequisiteCourseId => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoursePrerequisiteCopyWith<CoursePrerequisite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursePrerequisiteCopyWith<$Res> {
  factory $CoursePrerequisiteCopyWith(
          CoursePrerequisite value, $Res Function(CoursePrerequisite) then) =
      _$CoursePrerequisiteCopyWithImpl<$Res, CoursePrerequisite>;
  @useResult
  $Res call({int? prerequisiteCourseId, String? courseName});
}

/// @nodoc
class _$CoursePrerequisiteCopyWithImpl<$Res, $Val extends CoursePrerequisite>
    implements $CoursePrerequisiteCopyWith<$Res> {
  _$CoursePrerequisiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prerequisiteCourseId = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_value.copyWith(
      prerequisiteCourseId: freezed == prerequisiteCourseId
          ? _value.prerequisiteCourseId
          : prerequisiteCourseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoursePrerequisiteImplCopyWith<$Res>
    implements $CoursePrerequisiteCopyWith<$Res> {
  factory _$$CoursePrerequisiteImplCopyWith(_$CoursePrerequisiteImpl value,
          $Res Function(_$CoursePrerequisiteImpl) then) =
      __$$CoursePrerequisiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? prerequisiteCourseId, String? courseName});
}

/// @nodoc
class __$$CoursePrerequisiteImplCopyWithImpl<$Res>
    extends _$CoursePrerequisiteCopyWithImpl<$Res, _$CoursePrerequisiteImpl>
    implements _$$CoursePrerequisiteImplCopyWith<$Res> {
  __$$CoursePrerequisiteImplCopyWithImpl(_$CoursePrerequisiteImpl _value,
      $Res Function(_$CoursePrerequisiteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prerequisiteCourseId = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_$CoursePrerequisiteImpl(
      prerequisiteCourseId: freezed == prerequisiteCourseId
          ? _value.prerequisiteCourseId
          : prerequisiteCourseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoursePrerequisiteImpl implements _CoursePrerequisite {
  const _$CoursePrerequisiteImpl(
      {required this.prerequisiteCourseId, this.courseName});

  factory _$CoursePrerequisiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoursePrerequisiteImplFromJson(json);

  @override
  final int? prerequisiteCourseId;
  @override
  final String? courseName;

  @override
  String toString() {
    return 'CoursePrerequisite(prerequisiteCourseId: $prerequisiteCourseId, courseName: $courseName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursePrerequisiteImpl &&
            (identical(other.prerequisiteCourseId, prerequisiteCourseId) ||
                other.prerequisiteCourseId == prerequisiteCourseId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prerequisiteCourseId, courseName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursePrerequisiteImplCopyWith<_$CoursePrerequisiteImpl> get copyWith =>
      __$$CoursePrerequisiteImplCopyWithImpl<_$CoursePrerequisiteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoursePrerequisiteImplToJson(
      this,
    );
  }
}

abstract class _CoursePrerequisite implements CoursePrerequisite {
  const factory _CoursePrerequisite(
      {required final int? prerequisiteCourseId,
      final String? courseName}) = _$CoursePrerequisiteImpl;

  factory _CoursePrerequisite.fromJson(Map<String, dynamic> json) =
      _$CoursePrerequisiteImpl.fromJson;

  @override
  int? get prerequisiteCourseId;
  @override
  String? get courseName;
  @override
  @JsonKey(ignore: true)
  _$$CoursePrerequisiteImplCopyWith<_$CoursePrerequisiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
