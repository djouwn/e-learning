import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';

class UpdateTutorInfo extends GetxController {
  final String apiUrl = 'http://192.168.1.13:5000'; 
LoginController loginController=Get.put(LoginController());
  Future<void> updateUser( bool hasExperience, bool comfortableIT) async {
    const String updateEndpoint = '/update_user_id';
    final String updateUrl = '$apiUrl$updateEndpoint';
Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }
   String? token = await getCurrentToken();
    if (kDebugMode) {
      print(token);
    }
    String? userId = await loginController.getuserid(token!);
    try {
      final response = await http.post(
        Uri.parse(updateUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': userId,
          'has_experience': hasExperience,
          'comfortable_IT': comfortableIT,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User updated successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed to update user: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
