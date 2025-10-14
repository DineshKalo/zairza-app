import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/roadmap_model.dart';

class roadmapListController extends GetxController{
  var roadmaps = <Roadmap>[].obs; //list of roadmaps
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRoadmap();
  }

  Future<void> fetchRoadmap () async{
    const String apiUrl = "https://zairza-app-backend.vercel.app/zairza/getRoadmap";
    try{
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        roadmaps.value = jsonResponse.map((json) => Roadmap.fromJson(json)).toList();
      }else {
        Get.snackbar("Error", "Failed to load roadmap");
      }
    }catch(e){
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }

  }



}

class roadmapController extends GetxController{
  var roadmap = {}.obs;
  RxBool isLoading = true.obs;


  Future<void> fetchRoadmapByID( String ID) async{

    final String apiUrl = "https://zairza-app-backend.vercel.app/zairza/getRoadmap/$ID" ;
    try{
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      print(response.body);
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);

        if (jsonData != null) {
          roadmap.value = jsonData;
        } else {
          Get.snackbar("No Data", "No roadmap found");
        }
      } else {
        Get.snackbar("Error", "Failed to fetch roadmap: ${response.reasonPhrase}");
      }

    }catch(e){
      Get.snackbar("controller Error ", e.toString());
      print( e.toString());
    } finally {
      isLoading(false);
    }
  }



}