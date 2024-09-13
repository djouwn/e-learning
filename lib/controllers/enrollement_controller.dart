import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';


class EnrollementController extends GetxController {
  final LoginController loginController = Get.find();

  Future<String?> getCurrentUser(String userId) async {
    return loginController.getuserid(userId);
  }

  Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }

  Future<String?> getCurrentRole(String role) async {
    return loginController.getuserrole(role);
  }

  Future<void> enroll(String courseID) async {
    try {
      final String? token = await getCurrentToken();
      final String? userId = await getCurrentUser(token!);
      final String? role = await getCurrentRole(token);

      if (userId != null && role != null) {
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final Map<String, String> body = {
          "studentid": userId,
          "courseid": courseID,
        };

        final response = await http.post(
          Uri.parse('http://192.168.1.13:5000/add_enrollment'),
          headers: headers,
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          Get.snackbar('Enrolled!', "Congratulations! You've been enrolled in this course.");

        } else {
          Get.snackbar('Error Occurred!', "Sorry, you can't enroll in this course.");
       //   Get.to(VideoPage(courseId: courseID, questionId: '',));
        }
      } else {
        Get.snackbar('Error Occurred!', "Unable to fetch user details.");
      }
    } catch (e) {
      Get.snackbar('Error Occurred!', "An unexpected error occurred.");
    }
  }
}
