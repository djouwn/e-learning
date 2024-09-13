import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EnrollmentController extends GetxController {
  RxList<dynamic> enrollments = [].obs;

  Future<void> fetchEnrollments({String? studentId, String? courseId, String? enrollmentId, int page = 1, int pageSize = 10}) async {
    try {
      String url = 'http://192.168.1.13:5000/fetch-enrollment?page=$page&page_size=$pageSize';
      if (studentId != null) url += '&student_id=$studentId';
      if (courseId != null) url += '&course_id=$courseId';
      if (enrollmentId != null) url += '&enrollment_id=$enrollmentId';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List< dynamic> responseData = jsonDecode(response.body);
        enrollments.value = responseData;
      } else {
        enrollments.clear();
        throw Exception('Failed to fetch enrollments: ${response.reasonPhrase}');
      }
    } catch (e) {
      enrollments.clear();
      if (kDebugMode) {
        print('Error fetching enrollments: $e');
      }
    }
  }
}
