import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PasswordUpdateController extends GetxController {
  Future<void> updatePassword(String email, String password, String role) async {
    const String apiUrl = 'http://192.168.1.13:5000/update-password';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
          'role': role,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Password updated successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed to update password: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
