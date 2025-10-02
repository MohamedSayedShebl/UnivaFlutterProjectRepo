// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

/// @nodoc
mixin _$Announcement {
  int? get announcement_id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get author_id => throw _privateConstructorUsedError;
  int? get course_section_id => throw _privateConstructorUsedError;
  bool? get is_published => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementCopyWith<Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res, Announcement>;
  @useResult
  $Res call(
      {int? announcement_id,
      String title,
      String content,
      int? author_id,
      int? course_section_id,
      bool? is_published});
}

/// @nodoc
class _$AnnouncementCopyWithImpl<$Res, $Val extends Announcement>
    implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcement_id = freezed,
    Object? title = null,
    Object? content = null,
    Object? author_id = freezed,
    Object? course_section_id = freezed,
    Object? is_published = freezed,
  }) {
    return _then(_value.copyWith(
      announcement_id: freezed == announcement_id
          ? _value.announcement_id
          : announcement_id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author_id: freezed == author_id
          ? _value.author_id
          : author_id // ignore: cast_nullable_to_non_nullable
              as int?,
      course_section_id: freezed == course_section_id
          ? _value.course_section_id
          : course_section_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_published: freezed == is_published
          ? _value.is_published
          : is_published // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementImplCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$$AnnouncementImplCopyWith(
          _$AnnouncementImpl value, $Res Function(_$AnnouncementImpl) then) =
      __$$AnnouncementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? announcement_id,
      String title,
      String content,
      int? author_id,
      int? course_section_id,
      bool? is_published});
}

/// @nodoc
class __$$AnnouncementImplCopyWithImpl<$Res>
    extends _$AnnouncementCopyWithImpl<$Res, _$AnnouncementImpl>
    implements _$$AnnouncementImplCopyWith<$Res> {
  __$$AnnouncementImplCopyWithImpl(
      _$AnnouncementImpl _value, $Res Function(_$AnnouncementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcement_id = freezed,
    Object? title = null,
    Object? content = null,
    Object? author_id = freezed,
    Object? course_section_id = freezed,
    Object? is_published = freezed,
  }) {
    return _then(_$AnnouncementImpl(
      announcement_id: freezed == announcement_id
          ? _value.announcement_id
          : announcement_id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author_id: freezed == author_id
          ? _value.author_id
          : author_id // ignore: cast_nullable_to_non_nullable
              as int?,
      course_section_id: freezed == course_section_id
          ? _value.course_section_id
          : course_section_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_published: freezed == is_published
          ? _value.is_published
          : is_published // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementImpl implements _Announcement {
  const _$AnnouncementImpl(
      {this.announcement_id,
      required this.title,
      required this.content,
      this.author_id,
      this.course_section_id,
      this.is_published});

  factory _$AnnouncementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementImplFromJson(json);

  @override
  final int? announcement_id;
  @override
  final String title;
  @override
  final String content;
  @override
  final int? author_id;
  @override
  final int? course_section_id;
  @override
  final bool? is_published;

  @override
  String toString() {
    return 'Announcement(announcement_id: $announcement_id, title: $title, content: $content, author_id: $author_id, course_section_id: $course_section_id, is_published: $is_published)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementImpl &&
            (identical(other.announcement_id, announcement_id) ||
                other.announcement_id == announcement_id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author_id, author_id) ||
                other.author_id == author_id) &&
            (identical(other.course_section_id, course_section_id) ||
                other.course_section_id == course_section_id) &&
            (identical(other.is_published, is_published) ||
                other.is_published == is_published));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, announcement_id, title, content,
      author_id, course_section_id, is_published);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementImplCopyWith<_$AnnouncementImpl> get copyWith =>
      __$$AnnouncementImplCopyWithImpl<_$AnnouncementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementImplToJson(
      this,
    );
  }
}

abstract class _Announcement implements Announcement {
  const factory _Announcement(
      {final int? announcement_id,
      required final String title,
      required final String content,
      final int? author_id,
      final int? course_section_id,
      final bool? is_published}) = _$AnnouncementImpl;

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$AnnouncementImpl.fromJson;

  @override
  int? get announcement_id;
  @override
  String get title;
  @override
  String get content;
  @override
  int? get author_id;
  @override
  int? get course_section_id;
  @override
  bool? get is_published;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementImplCopyWith<_$AnnouncementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
