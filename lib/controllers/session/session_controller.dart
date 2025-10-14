import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/session_model.dart';

class sessionListController extends GetxController{
  var sessions = <Session>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSession();
  }

  Future<void> fetchSession () async{
    const String apiUrl = "https://zairza-app-backend.vercel.app/zairza/getSession";
    try{
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        sessions.value = jsonResponse.map((json) => Session.fromJson(json)).toList();
      }else {
        Get.snackbar("Error", "Failed to load session");
      }
    }catch(e){
      print("Error:$e");
    } finally {
      isLoading(false);
    }

  }
}

class sessionController extends GetxController{
  var session = {}.obs;
  RxBool isLoading = true.obs;


  Future<void> fetchSessionByID( String ID) async{

    final String apiUrl = "https://zairza-app-backend.vercel.app/zairza/getSession/$ID" ;
    try{
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);

        if (jsonData != null) {
          session.value = jsonData;
        } else {
          Get.snackbar("No Data", "No Session found");
        }
      } else {
        Get.snackbar("Error", "Failed to fetch Session: ${response.reasonPhrase}");
      }

    }catch(e){
      Get.snackbar("controller Error ", e.toString());
      print( e.toString());
    } finally {
      isLoading(false);
    }
  }



}