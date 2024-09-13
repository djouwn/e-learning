import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:learnfast/controllers/login.dart';

class PreferencesController extends GetxController {
  final String baseUrl = 'http://192.168.1.13:5000';
  LoginController loginController = Get.put(LoginController());
  String? courseId;
  Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }
  Future<void> addPreferences( List<String> specialiteId) async {
    String? token = await getCurrentToken();
    if (kDebugMode) {
      print(token);
    }
    String? userId = await loginController.getuserid(token!);
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/add-preferences'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'student_id': userId, 'specialite_id': specialiteId}),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Preferences added successfully');
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Message: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
    }
  }
}
