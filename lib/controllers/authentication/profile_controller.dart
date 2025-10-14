import 'package:get/get.dart';
import 'profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  var profile = {}.obs;
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchProfile() async {
    isLoading.value = true;
    error.value = '';
    try {
      final data = await _profileService.getProfile();
      if (data.isNotEmpty) {
        profile.value = data;
      } else {
        throw Exception("No profile data received");
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Error", "Failed to load profile: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: Refresh profile method
  Future<void> refreshProfile() async {
    await fetchProfile();
  }
}