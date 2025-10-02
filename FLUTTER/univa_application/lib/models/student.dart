import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    @JsonKey(name: 'student_id') int? studentId,
    @JsonKey(name: 'user_id') int? userId,
    String? phone,
    String? address,
    @JsonKey(name: 'current_gpa') double? currentGpa,
    @JsonKey(name: 'total_credits') int? totalCredits,
    String? level,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}