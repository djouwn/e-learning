import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/views/profiletutor/add_first_quizz.dart';

class UploadVideosController extends GetxController {
  Future<void> uploadVideos(
    String courseId,
    List<File> videoFiles,
  ) async {
    try {
      for (var videoFile in videoFiles) {
        var uri = Uri.parse('http://192.168.1.13:5000/upload-video?course_id=$courseId');

        var request = http.MultipartRequest('POST', uri)
          ..files.add(await http.MultipartFile.fromPath('video', videoFile.path));

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('Video uploaded successfully!');
          }
          Get.to(AddYourFirstQuizz(courseId: courseId));
        } else {
          if (kDebugMode) {
            print('Failed to upload video. Status code: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
