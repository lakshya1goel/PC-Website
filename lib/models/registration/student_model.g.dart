// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      mobile_number: json['mobile_number'] as String,
      gender: json['gender'] as String? ?? 'Male',
      college_email: json['college_email'] as String,
      student_id: json['student_id'] as String,
      branch: json['branch'] as String? ?? 'CSE',
      section: json['section'] as String? ?? 'S1',
      is_hosteler: json['is_hosteler'] as bool? ?? false,
      hacker_rank_id: json['hacker_rank_id'] as String,
      is_contest_only: json['is_contest_only'] as bool? ?? false,
      university_roll_number: json['university_roll_number'] as String,
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'mobile_number': instance.mobile_number,
      'gender': instance.gender,
      'college_email': instance.college_email,
      'student_id': instance.student_id,
      'branch': instance.branch,
      'section': instance.section,
      'is_hosteler': instance.is_hosteler,
      'hacker_rank_id': instance.hacker_rank_id,
      'is_contest_only': instance.is_contest_only,
      'university_roll_number': instance.university_roll_number,
    };
