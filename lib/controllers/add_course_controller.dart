import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import this for MediaType
import 'package:learnfast/controllers/courses_controller.dart';
import 'package:learnfast/controllers/login.dart';
import 'package:learnfast/test/upload_tes.dart';
import 'package:learnfast/views/profiletutor/add_video_link.dart';

class AddCoursesController extends GetxController {
  CoursesController coursesController = Get.put(CoursesController());
  LoginController loginController = Get.put(LoginController());

  String? questionId;

  Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }

  Future<bool> addCourses(String purpose, String name, String requirements, File imageFile) async {
    try {
      String? token = await getCurrentToken();
      if (kDebugMode) {
        print(token);
      }

      String? userId = await loginController.getuserid(token!);
      String? role = await loginController.getuserrole(token);

      if (role == "tutor") {
        // Create a MultipartRequest
        var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.13:5000/add-course'));

        // Add other fields to the request
        request.fields.addAll({
          "tutor_id": userId ?? 'token_unavailable',
          "purpose": purpose,
          "name": name,
          "requirements": requirements,
        });

        // Add the image file to the request
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          contentType: MediaType('image', 'jpg'), // Adjust the content type as per your image type
        ));

        // Send the request
        var response = await request.send();

        if (response.statusCode != 200) {
          Get.snackbar('An error occurred!', "Sorry, you can't enroll in this course!");
          return false;
        } else {
          var jsonResponse = await response.stream.bytesToString();

          // Convert the JSON response to a Map
          var responseData = json.decode(jsonResponse);

          // Check if courseId is present in the response
          if (responseData.containsKey('course_id')) {
            String courseId = responseData['course_id'];
            if (kDebugMode) {
              print(courseId);
            }
            if (kDebugMode) {
              print(courseId);
            }
            
            if (coursesController.isTutorExperienced!) {
              Get.to(FilePickerDemo(title: '', courseId: courseId));
            } else {
              Get.to(AddVideosPage(courseId: courseId));
            }
            return true;
          } else {
            Get.snackbar('An error occurred!', "Sorry, course ID is not available.");
            return false;
          }
        }
      } else {
        Get.snackbar('An error occurred!', "Not the required role!");
        return false;
      }
    } catch (e) {
      
      Get.snackbar('An error occurred!', "Sorry, an error occurred. Please try again.");
      return false;
    }
  }
}
