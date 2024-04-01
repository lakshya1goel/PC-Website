import 'package:pcwebsite/models/registration/student_model.dart';

bool canGoFurther = false;
bool registered = false;

List<String> genderList = ['Male', 'Female', 'Others'];
List<String> branchList = <String>['CSE', 'CSE-AIML', 'CSE-DS', 'CS', 'AIML', 'CSIT', 'IT', 'ECE', 'EN', 'ME', 'CE'];
List<String> sectionList = List.generate(20, (index) => 'S${index + 1}');

StudentModel studentModel = const StudentModel(first_name: '', last_name: '', mobile_number: '', college_email: '', student_id: '', hacker_rank_id: '', university_roll_number: '');