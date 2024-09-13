import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DeleteCourse extends GetxController{
Future<void> deleteCourse(String courseId) async {
  try {
  
    String url = 'http://192.1681.13:5000/delete-course?course_id=$courseId';

   
    final response = await http.delete(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
     
      if (kDebugMode) {
        print('Course deleted successfully');
      }
    } else {
      
      if (kDebugMode) {
        print('Failed to delete course: ${response.body}');
      }
    }
  } catch (e) {
   
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
}