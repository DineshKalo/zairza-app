import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://zairza-app-backend.vercel.app/zairza";
  final http.Client client = http.Client();

  // Default timeout duration for requests
  final Duration timeoutDuration = Duration(seconds:300);

  // POST request
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await client
          .post(
        Uri.parse("$baseUrl/$endpoint"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      )
          .timeout(timeoutDuration);

      return _processResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // GET request
  Future<dynamic> get(String endpoint, {String? token}) async {
  try {
    final headers = {
      if (token != null) "Authorization": "Bearer $token", // Added Bearer prefix
      "Content-Type": "application/json",
    };
    final response = await client
        .get(
      Uri.parse("$baseUrl/$endpoint"),
      headers: headers,
    )
        .timeout(timeoutDuration);

    return _processResponse(response);
  } catch (e) {
    rethrow;
  }
}

  // Process the response and handle success or error
  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // You can return a specific type here
      return jsonDecode(response.body);
    } else {
      // Handle API error responses
      _handleApiError(response);
    }
  }

  // Handle API error responses
  void _handleApiError(http.Response response) {
    String errorMessage = 'An error occurred: ${response.statusCode}';
    try {
      final errorBody = jsonDecode(response.body);
      if (errorBody is Map && errorBody['message'] != null) {
        errorMessage = errorBody['message'];
      }
    } catch (e) {
      // If body is not in JSON format, just use the status code
    }
    throw Exception(errorMessage);
  }
}
