import 'dart:convert';
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';
import 'package:http/http.dart' as http;

class QuizzOptionsController extends GetxController {
  LoginController loginController = Get.put(LoginController());

  Future<String?> getCurrentUser(String userId) async {
    return loginController.getuserid(userId);
  }

  Future<String?> getCurrentToken(String token) async {
    return loginController.gettoken();
  }

  Future<String?> getCurrentRole(String role) {
    return loginController.getuserrole(role);
  }

  Future<void> addOptions(

    String questionId,
    List<String> options,
    List<String> rightAnswers,
  ) async {
    try {



        Map<String, String> headers = {
          'Content-Type': 'application/json',
      //    'Authorization': 'Bearer $token',
        };

        Map<String, dynamic> body = {
          "question_id": questionId,
          "options": options,
        'right_answers':rightAnswers
        };

        final response = await http.post(
          Uri.parse('http://192.168.1.13:5000/add-options'),
          headers: headers,
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          Get.snackbar('Options Added', 'Options added successfully!');
        } else {
          Get.snackbar('Error', 'Failed to add options. Please try again.');
        }

    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }
}
