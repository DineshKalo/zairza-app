import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/event_model.dart';
import '../api_service.dart';

class EventController extends GetxController {
  final ApiService apiService = ApiService();
  // List of blogs
  var events = <Event>[].obs;
  var event = {}.obs;
  var isLoading = true.obs;

  // Fetch all blogs
  Future<void> fetchEvents() async {
    const String apiUrl = "https://zairza-app-backend.vercel.app/zairza/retrieveEvent";
    try {
      isLoading(true);
      final response = await apiService.get('retrieveEvent');
      final List<dynamic> jsonData = response;
      events.value = jsonData.map((json) => Event.fromJson(json)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false); // Set loading to false
    }
  }
  //fetch Blog by ID
  Future<void> fetchEventByID( String ID) async{
    const ID = "";
    const String apiUrl = "https://zairza-app-backend.vercel.app/zairza/retrieveEvent/$ID";
    try{
      final response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body)['data'];

        if (jsonData['data'] != null) {
          event.value = jsonData['data']; // Assuming `blog` is a Rx variable.
        } else {
          Get.snackbar("No Data", "No blog found for the given ID");
        }
      }

    }catch(e){
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false); // Set loading to false
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchEvents(); // Fetch blogs when controller is initialized
  }
}
