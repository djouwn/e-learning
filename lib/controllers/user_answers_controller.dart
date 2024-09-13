import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserAnswersController extends GetxController {
  Future<String?> submitAnswers(List<String> answers, String questionId) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/submit-answers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'answers': answers, 'questionId': questionId}),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Answers submitted successfully');
        }
        return response.body;
      } else {
        if (kDebugMode) {
          print('Failed to submit answers: ${response.body}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
  }
}
