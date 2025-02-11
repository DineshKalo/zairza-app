import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/blog_model.dart';
import '../api_service.dart';

class BlogController extends GetxController {
  final ApiService apiService = ApiService();
  // List of blogs
  var blogs = <Blog>[].obs;
  var blog = {}.obs;
  var isLoading = true.obs;

  // Fetch all blogs
  Future<void> fetchBlogs() async {
    const String apiUrl = "https://zairzaappbackend.onrender.com/zairza/getBlogs";
    try {
      isLoading(true);
      final response = await apiService.get('getBlogs');
      final List<dynamic> jsonData = response['data'];
      blogs.value = jsonData.map((json) => Blog.fromJson(json)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false); // Set loading to false
    }
  }
  //fetch Blog by ID
  Future<void> fetchBlogByID( String ID) async{
    const ID = "";
    const String apiUrl = "https://zairzaappbackend.onrender.com/zairza/getBlogs/$ID";
    try{
      final response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body)['data'];

        if (jsonData['data'] != null) {
          blog.value = jsonData['data']; // Assuming `blog` is a Rx variable.
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
    fetchBlogs(); // Fetch blogs when controller is initialized
  }
}
