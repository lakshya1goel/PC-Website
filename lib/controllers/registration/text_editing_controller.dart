import 'package:flutter/material.dart';
import 'package:pcwebsite/utils/constants/data/const.dart';

class TextControllers {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController studentNumber = TextEditingController();
  final TextEditingController universityRollNo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController contactNo = TextEditingController();
  final TextEditingController hackerrankId = TextEditingController();

  void updateData(){
    studentModel = studentModel.copyWith(first_name: firstName.text.trim());
    studentModel = studentModel.copyWith(last_name: lastName.text.trim());
    studentModel = studentModel.copyWith(student_id: studentNumber.text.trim());
    studentModel = studentModel.copyWith(university_roll_number: universityRollNo.text.trim());
    studentModel = studentModel.copyWith(college_email: email.text.trim());
    studentModel = studentModel.copyWith(mobile_number: contactNo.text.trim());
    studentModel = studentModel.copyWith(hacker_rank_id: hackerrankId.text.trim());
  }

  void clearAll(){
    firstName.clear();
    lastName.clear();
    studentNumber.clear();
    universityRollNo.clear();
    email.clear();
    contactNo.clear();
    hackerrankId.clear();
  }

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    studentNumber.dispose();
    universityRollNo.dispose();
    email.dispose();
    contactNo.dispose();
    hackerrankId.dispose();
  }
}
