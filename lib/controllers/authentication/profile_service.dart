import '../api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        throw Exception("No authentication token found. Please log in.");
      }

      // Use the token parameter instead of headers for consistency
      final response = await _apiService.get(
        "user/profile", // Changed endpoint to match your auth controller
        token: token, // Use the token parameter
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
