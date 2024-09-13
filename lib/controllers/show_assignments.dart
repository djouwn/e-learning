import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TutorAssignmentController extends GetxController {
  final String baseUrl = 'your_api_base_url_here'; // Update with your API base URL

  Future<void> assignTutor({
    required String tutorId,
    required String studentId,
    required String courseId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/assign-tutor'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'tutor_id': tutorId,
          'student_id': studentId,
          'course_id': courseId,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Tutor assigned successfully');
      } else {
        Get.snackbar('Error', 'Failed to assign tutor');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to assign tutor: $e');
    }
  }

  Future<void> unassignTutor({
    required String tutorId,
    required String studentId,
    required String courseId,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/unassign-tutor'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'tutor_id': tutorId,
          'student_id': studentId,
          'course_id': courseId,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Tutor unassigned successfully');
      } else {
        Get.snackbar('Error', 'Failed to unassign tutor');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to unassign tutor: $e');
    }
  }

  Future<void> getTutorAssignments() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tutor-assignments'));

      if (response.statusCode == 200) {
    
      } else {
        Get.snackbar('Error', 'Failed to fetch tutor assignments');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch tutor assignments: $e');
    }
  }
}
