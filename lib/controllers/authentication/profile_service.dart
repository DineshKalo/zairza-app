import '../api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      // print('Saved Token: $token');
      // print('Headers being sent: {"Authorization": "Bearer $token"}');

      if (token == null|| token.isEmpty) {
        throw Exception("No authentication token found. Please log in.");
      }
      final headers = {
        "Authorization": "$token", 
      };
      final response = await _apiService.get(
        "getProfile",
        headers: headers,
      );

      if (response['success'] == true) {
        return response['data'];
      } else {
        throw Exception(response['message'] ?? "Failed to fetch profile.");
      }
    } catch (e) {
      throw Exception("Error fetching profile: $e");
    }
  }
}
