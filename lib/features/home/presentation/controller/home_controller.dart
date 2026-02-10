import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  // loading state
  var isLoading = false.obs;

  // api data list
  var posts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  // GET API call
  Future<void> fetchPosts() async {
    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'User-Agent': 'Mozilla/5.0',
        },
      );
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        posts.value = data.cast<Map<String, dynamic>>();
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
