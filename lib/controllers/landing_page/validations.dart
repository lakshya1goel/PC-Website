
bool validateCollegeEmail(String email) {
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@akgec\.ac\.in$');

  return emailRegex.hasMatch(email);
}