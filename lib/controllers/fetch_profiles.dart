import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';

class FetchProfileController extends GetxController {
  List<dynamic> allMyProfile = [];

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    LoginController loginController = Get.put(LoginController());
    try {
      String? token = await loginController.gettoken();
      String? userId = await loginController.getuserid(token!);
      String? role = await loginController.getuserrole(token);

      String url = 'http://192.168.1.13:5000/fetch-profile';
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      Map<String, dynamic> requestBody = {
        'userid': userId,
        'role': role,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> profiles = responseData['profiles'];
        if (kDebugMode) {
          print(profiles);
        }
        allMyProfile.addAll(profiles); // Use addAll to add elements individually
      } else if (response.statusCode == 404) {
        if (kDebugMode) {
          print('No profiles found for $role');
        }
      } else {
        if (kDebugMode) {
          print('Failed to fetch profiles: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
