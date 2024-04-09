class Validator {
  bool validateCollegeEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@akgec\.ac\.in$');
    return emailRegex.hasMatch(email);
  }

  bool validateName(String name) {
    final RegExp nameRegex = RegExp(r"^[a-zA-Z\s'-.]+$");
    return nameRegex.hasMatch(name);
  }

  bool validateMobileNum(String mobileNum) {
    final RegExp mobileNumRegex = RegExp(r'^[6-9][0-9]{9}$');
    return mobileNumRegex.hasMatch(mobileNum);
  }

  bool validateStudentNum(String studentNum) {
    final RegExp studentNumRegex = RegExp(r'^(22|23)[0-9a-zA-Z_-]+$');
    return studentNumRegex.hasMatch(studentNum);
  }

  bool validateUniversityRollNum(String universityRollNum) {
    final RegExp universityRollNumRegex = RegExp(r'^(22|23)\d{11}$');
    return universityRollNumRegex.hasMatch(universityRollNum);
  }

  bool validHackerrankId(String hackerrankId) {
    return hackerrankId.isNotEmpty;
  }
}