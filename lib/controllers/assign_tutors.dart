import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TutorAssignmentController  extends GetxController{
  static Future<String> assignTutor({
    required String tutorId,
    required String studentId,
    required String courseId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('your_api_endpoint/assign-tutor'),
        body: {
          'tutor_id': tutorId,
          'student_id': studentId,
          'course_id': courseId,
        },
      );

      if (response.statusCode == 200) {
        return 'Tutor assigned successfully';
      } else {
        return 'Failed to assign tutor';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String> unassignTutor({
    required String tutorId,
    required String studentId,
    required String courseId,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse('your_api_endpoint/unassign-tutor'),
        body: {
          'tutor_id': tutorId,
          'student_id': studentId,
          'course_id': courseId,
        },
      );

      if (response.statusCode == 200) {
        return 'Tutor unassigned successfully';
      } else {
        return 'Failed to unassign tutor';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
