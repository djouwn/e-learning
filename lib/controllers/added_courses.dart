import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddeCoursesByTutor extends GetxController {
  Future<List<dynamic>> checkAddedCourses(String tutorId) async {
    try {
      String url = 'http://192.168.1.13:5000/check-added-courses?tutor_id=$tutorId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        List<dynamic> addedCourses = responseData['added_courses'];
        if (kDebugMode) {
          print(addedCourses);
        }
        return addedCourses;
      } else {
        throw Exception('Failed to fetch added courses: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
