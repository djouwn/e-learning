import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/views/allprofile/verify_otp.dart';
class PasswordResetController extends GetxController {
Future<void> resetPassword(String email) async {
  const String apiUrl = 'http://192.168.1.13:5000/reset';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        Get.to(VerifyOtp());
        print('Reset email sent successfully');
      }
    } else if (response.statusCode == 404) {
      if (kDebugMode) {
        print('User not found');
      }
    } else {
      if (kDebugMode) {
        print('Failed to reset password: ${response.body}');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
}


