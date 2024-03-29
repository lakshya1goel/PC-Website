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
    var request = http.Request('GET', Uri.parse('${apiUrl}tl'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      Map<String, dynamic> data = json.decode(jsonString);

      int days = data['days'] ?? 0;
      int hours = data['hours'] ?? 0;
      int minutes = data['minutes'] ?? 0;
      int seconds = data['seconds'] ?? 0;

      return Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
    } else {
      throw Exception('Failed to fetch duration: ${response.reasonPhrase}');
    }
  }

  Future<void> subscribeEmail(String email) async {

    String url = "${apiUrl}subscribe";
    var request = http.Request('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode({'email': email});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());
    } else if(response.statusCode == 400){
      print(await response.stream.bytesToString());
    }
    else{
      print(response.reasonPhrase);
    }
  }

}