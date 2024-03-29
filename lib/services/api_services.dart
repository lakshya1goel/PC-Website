import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;
  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> registerUser(
      String firstName,
      String lastName,
      String mobNum,
      String gender,
      String email,
      String studentNum,
      String branch,
      String section,
      bool isHosteler,
      String hackerrankId,
      bool isContestOnly,
      String recaptchaToken
      ) async {
        var headers = {
          'Content-Type': 'application/json',
          'Recaptcha-Token': recaptchaToken
        };
        var url = Uri.parse('$apiUrl/api/register');
        var body = jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "mobile_number": mobNum,
          "gender": gender,
          "college_email": email,
          "student_id": studentNum,
          "branch": branch,
          "section": section,
          "is_hosteler": isHosteler,
          "hacker_rank_id": hackerrankId,
          "is_contest_only": isContestOnly
        });

        var response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 201) {
          print(response.body);
          return jsonDecode(response.body);
        }
        else {
          print(response.body);
          throw Exception('Failed to register user');
        }
      }
}