import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:pcwebsite/models/registration/student_model.dart';


class ApiService {
  final String apiUrl;
  ApiService(this.apiUrl);

  Future registerUser(StudentModel student) async {
    String token = await generateToken() ?? 'NULL';
    var headers = {
      'Content-Type': 'application/json',
      'Recaptcha-Token': token
    };
    var url = Uri.parse('${apiUrl}register');
    var body = jsonEncode(student.toJson());
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      print(response.body);
      return response;
    }
    else {
      return response;
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

      days = days < 0 ? 0 : days;
      hours = hours < 0 ? 0 : hours;
      minutes = minutes < 0 ? 0 : minutes;
      seconds = seconds < 0 ? 0 : seconds;

      return Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
    } else {
      throw Exception('Failed to fetch duration: ${response.reasonPhrase}');
    }
  }

  Future subscribeEmail(String email) async {
    String? token = await generateToken() ?? 'NULL';
    String url = "${apiUrl}subscribe";
    var response = await http.post(
      Uri.parse(url),
      headers:{
        'Content-Type': 'application/json',
        'Recaptcha-Token': token ?? ''
      },
      body: jsonEncode({'email': email,}),
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

  generateToken() async {
    String? token = await GRecaptchaV3.execute('submit');
    return token;
  }

}