import 'package:freezed_annotation/freezed_annotation.dart';

import 'student.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? username,
    String? email,
    Student? student,
    Map<String, dynamic>? faculty,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}