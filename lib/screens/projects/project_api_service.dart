import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zairza_app/constants/global_variables.dart';

class ProjectApiService {
  final String baseUrl;

  ProjectApiService() : baseUrl = GlobalVariables.baseUrl;

  Future<List<dynamic>> retrieveEvents() async {
    final url = Uri.parse('$baseUrl/zairza/retrieveEvent');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body) as List<dynamic>;
      } else {
        return [];
      }
    } catch (e) {
      print("Exception caught: $e");
      return [];
    }
  }
}
