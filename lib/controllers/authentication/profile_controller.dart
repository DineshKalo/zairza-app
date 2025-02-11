import 'package:get/get.dart';
import 'profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  var profile = {}.obs;
  var isLoading = false.obs;

  Future<void> fetchProfile() async {
    isLoading.value = true;
    try {
      final data = await _profileService.getProfile();
      profile.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
