import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
abstract class StudentModel with _$StudentModel {
  const factory StudentModel({
    required String first_name,
    required String last_name,
    required String mobile_number,
    @Default('Male') String gender,
    required String college_email,
    required String student_id,
    @Default('CSE') String branch,
    @Default('S1') String section,
    @Default(false) bool is_hosteler,
    required String hacker_rank_id,
    @Default(false) bool is_contest_only,
    required String university_roll_number,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}
