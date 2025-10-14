import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/video_model.dart';

class VideoController extends  GetxController{
  var videos = <Video>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }
  Future<void> fetchVideos() async{
    const String apiUrl = "https://zairza-app-backend.vercel.app/zairza/getVideos";
    try{
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        final List<dynamic>  jsonResponse = json.decode(response.body);
        videos.value = jsonResponse.map((json) => Video.fromJson(json)).toList();
      }else {
        Get.snackbar("Error", "Failed to load videos");
      }
    }catch(e){
      print("Error:$e");
    }finally{
      isLoading(false);
    }
  }
}