import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


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
    var url = Uri.parse('$apiUrl/register');
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

  Future<Duration> parseDurationFromAPI() async {
    final url = Uri.parse('${apiUrl}tl');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      int days = data['days'] ?? 0;
      int hours = data['hours'] ?? 0;
      int minutes = data['minutes'] ?? 0;
      int seconds = data['seconds'] ?? 0;

      return Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
    } else {
      throw Exception('Failed to fetch duration: ${response.reasonPhrase}');
    }
  }

  Future subscribeEmail(String email) async {
    String url = "${apiUrl}subscribe";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 201) {
      return [true,jsonDecode(response.body)['message']];
    } else if (response.statusCode == 400) {
      return [true,jsonDecode(response.body)['message']];
    } else {
      print(response.reasonPhrase);
      return [true,response.reasonPhrase];
    }
  }

}