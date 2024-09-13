import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';
class DeleteFavoriteController extends GetxController{
  LoginController loginController=Get.put(LoginController());
   Future<String?> getCurrentUser(String token) async {
    return loginController.getuserid(token);
  }

  Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }
   Future<void> deleteFavorite(String courseId) async {
    final token=getCurrentToken();
    String ? userId= await getCurrentUser(token as String);
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      const String baseUrl="http://192.168.1.13:5000";

      final response = await http.delete(
        Uri.parse('$baseUrl/delete-favorites'),
        headers: headers,
        body: jsonEncode({'student_id': userId, 'course_id': courseId}),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Deleted!', "Course removed from favorites.");
     
      } else {
        throw Exception('Failed to delete favorite');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete favorite: $e');
    }
  }
}