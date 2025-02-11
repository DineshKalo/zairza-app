import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/project_model.dart';
import '../api_service.dart';
import '../../screens/projects/project_api_service.dart';
 import 'package:get/get.dart';

class ProjectController extends GetxController{
 var projects = <Project>[].obs;
 var project = {}.obs;
 var isLoading = true.obs;

 @override
 void onInit() {
  super.onInit();
  fetchProjects();
 }

 Future<void> fetchProjects() async {
  const String apiUrl = "https://zairzaappbackend.onrender.com/zairza/retrieveProjects";
  try {
   isLoading(true);
   final response = await http.get(Uri.parse(apiUrl));
   if (response.statusCode == 200) {
     final List<dynamic> jsonResponse = json.decode(response.body);
     projects.value = jsonResponse.map((json) => Project.fromJson(json)).toList();
   }else {
    Get.snackbar("Error", "Failed to load blogs");
   }
  } catch (e) {
   Get.snackbar("Error", e.toString());
   print(e.toString());

  } finally {
   isLoading(false);
  }
 }

 Future<void> fetchProjectsByID( String ID) async{
  const ID = "";
  const String apiUrl = "https://zairzaappbackend.onrender.com/zairza/retrieveProjects/$ID";
  try{
   final response = await http.get(Uri.parse(apiUrl));
   if(response.statusCode == 200){
    final jsonData = json.decode(response.body)['data'];
    if (jsonData['data'] != null) {
     project.value = jsonData['data'];
    } else {
     Get.snackbar("No Data", "No Projects found for the given ID");
    }
   }

  }catch(e){
   Get.snackbar("Error", e.toString());
  }
 }


}