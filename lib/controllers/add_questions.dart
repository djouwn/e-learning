import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/views/profiletutor/add_options.dart';
class AddQuestionsController extends GetxController {
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

  Future<void> addQuestions(String courseId,
      String questionName,
      String score,) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer $token',
      };

      Map<String, dynamic> body = {

        "course_id": courseId,
        "question_name": questionName,
        "score": score.toString(),
      };

      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/add-questions'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        String questionIdResponse=response.body;
        if (kDebugMode) {
          Get.to(AddOptions(courseId: courseId, questionId: questionIdResponse,));
          print(questionIdResponse);
        }
        Get.snackbar('Question Added', 'Question added successfully!');
      } else {
        Get.snackbar('Error', 'Failed to add question. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }

}