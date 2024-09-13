import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learnfast/test/video-sdk/screens/common/splash_screen.dart';


import 'package:learnfast/views/profileadmin/hello_admin.dart';
import 'package:learnfast/views/profilestudent/first_page_student.dart';
import 'package:learnfast/views/profiletutor/add_your_first_course.dart';


import '../views/profilestudent/courses_page.dart';

class LoginController extends GetxController {
  Future<bool> signin(String email, String password, String role) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      "role": role,
      "email": email,
      "password": password
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/login'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 200) {
        String responseBody = utf8.decoder.convert(response.bodyBytes);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(responseBody);
        if (kDebugMode) {
          print(decodedToken);
        }
        await storetoken(decodedToken);
        String rolereturned = decodedToken["role"].toString();
        if (kDebugMode) {
          print(rolereturned);
        }
        int loginCounter = decodedToken["login_count"] ?? 1;
        String userId = decodedToken["user_id"];
        await storeuserid(userId);
        await storeuserrole(rolereturned);
        if (kDebugMode) {
          print(rolereturned);
        }
        if (rolereturned == "tutor") {
           if (loginCounter == 1) {
           
          }else {
            Get.to(AddYourFirstCourse());
           }
          
        } else if (rolereturned == "student") {
          if (loginCounter == 1) {
            Get.to(WelcomeStudent());
          } else if (loginCounter > 1) {
            navigatetocourses();
          }
        } else if (rolereturned == "admin") {
          Get.to(const AdminPage());
        }
        else if (rolereturned == "institution") {
          Get.to( SplashScreen());
        }
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return false;
    }
    return false;
  }

  Future<void> storetoken(Map<String, dynamic> token) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(
      key: "token",
      value: token.toString(),
    );
  }

  Future<String?> gettoken() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return storage.read(
      key: "token",
    );
  }

  Future<void> storeuserid(String userid) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(
      key: "userid",
      value: userid,
    );
  }

  Future<String?> getuserid(String userid) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return storage.read(
      key: "userid",
    );
  }

  Future<void> storeuserrole(String role) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(
      key: "role",
      value: role,
    );
  }

  Future<String?> getuserrole(String role) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return storage.read(
      key: "role",
    );
  }

  void navigatetocourses() {
    Get.to(CoursesPage());
  }
}
