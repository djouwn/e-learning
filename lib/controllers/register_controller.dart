import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/views/authentication/login.dart';


class RegisterController extends GetxController {

  Future<bool> register(String email, String name, String role, String password) async {
    try {
  
      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map<String, String> body = {"name": name, "password": password, "role": role, "email": email};
if (kDebugMode) {
  print(body);
}
    
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/register'),
        headers: headers,
        body: jsonEncode(body),
      );

      // ignore: unnecessary_null_comparison
      if (response == null) {
        if (kDebugMode) {
          print('Error: HTTP response is null.');
        }
        return false;
      }

    
      if (response.statusCode != 200) {
        if (kDebugMode) {
       
          Get.snackbar("Sorry!", "User already exists");
        }
        return false;
      } else {
     
        Get.to(Login());
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
      
        print('Error: $e');
      }
      return false;
    }
  }
}
