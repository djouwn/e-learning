import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/courses_controller.dart';
import 'dart:convert';
import 'package:learnfast/model/course_model.dart';

class CoursesDetailsFetchController extends GetxController {
  CoursesController coursesController=Get.put(CoursesController());
  String? get courseId => coursesController.courseid;
  Course course=Course();
  @override
  void onInit() {
    super.onInit();
 
    fetchCourseDetails(courseId);
  }
  
  Future<void> fetchCourseDetails(courseId) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.13:5000/courses-detail/$courseId'),
        headers: {'Content-Type': 'application/json'},

      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        course = Course.fromJson(data['course']); 
        update(); 
      } else {
        throw Exception('Failed to fetch course details');
      }
    } catch (e) {
      throw Exception('Error fetching course details: $e');
    }
  }
}
