import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zairza_app/screens/authentication/sign_in.dart';
import '../../Nav.dart';
import '../../models/user_model.dart';
import '../api_service.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();
  var isAuthenticated = false.obs;
  var isLoading = false.obs;
  var currentUser = Rxn<UserModel>();


  @override
  void onInit() {
    super.onInit();
    restoreSession();
  }

  Future<void> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      try {
        final user = await fetchUserByToken(token);
        currentUser.value = user;
      } catch (e) {
        currentUser.value = null;
      }
    }
  }

  Future<bool> register({
    required String firstName,
    required String secondName,
    required String registrationNumber,
    required String branch,
    required String phoneNumber,
    required String email,
    required String password,
    required String batch,
  }) async {
    isLoading.value = true;
    try {
      final response = await apiService.post("register", {
        "first_name": firstName,
        "last_name": secondName,
        'registration_number': registrationNumber,
        'branch': branch,
        'phone_number': phoneNumber,
        'email': email,
        'password': password,
        'batch': batch,
      });

      isLoading.value = false;
    if (response['success'] == true) {
      Get.snackbar("Success", "Registration successful!");
      Get.offAll(() => SignIn()); // Navigate to login
      return true;
    } else {
      Get.snackbar("Error", response['message'] ?? "Registration failed");
      return false;
    }
  } catch (e) {
    isLoading.value = false;
    Get.snackbar("Error", "Registration failed: $e");
    return false;
  }
}

  // Login user
  Future<bool> login({required String email, required String password}) async {
    isLoading.value = true;
    try {
      final response = await apiService.post("login", {
        "input": email,
        "password": password,
      });

      if (response['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['token']);

        currentUser.value = UserModel.fromJson(response);
        isAuthenticated.value = true;
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Invalid credentials");
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      return false;
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      isAuthenticated.value = false;
      Get.offAll(() => SignIn()); 
    } catch (e) {
      Get.snackbar('Logout Failed', 'There was an problem logging out.');
    }
  }


  Future<UserModel> fetchUserByToken(String token) async {
  try {
    final response = await apiService.get('getprofile', token: token);
    if (response['success'] == true) {
      return UserModel.fromJson(response['data']);
    } else {
      throw Exception('Failed to fetch user');
    }
  } catch (e) {
    throw Exception('Failed to fetch user: $e');
  }
}
}
