import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zairza_app/constants/global_variables.dart';
import '../../controllers/authentication/auth_controller.dart';


class ProfileApiService {
  final String baseUrl;

  ProfileApiService() : baseUrl = GlobalVariables.baseUrl;
  Map<String, dynamic> loginID = {
    "email": "dineshkumarkalo@gmail.com",
    "password": "Password@123"
  };

  Future<Map<String, dynamic>> retrieveProfile() async {
    try {
      final loginResponse = await http.post(
        Uri.parse('$baseUrl/zairza/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginID),
      );
      if (loginResponse.statusCode != 200) {
        return {};
      }
      final token = jsonDecode(loginResponse.body)['token'];
      if (token == null) {
        return {};
      }

      final response =
          await http.get(Uri.parse('$baseUrl/zairza/getProfile'), headers: {
        'Authorization': "$token",
      });
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
