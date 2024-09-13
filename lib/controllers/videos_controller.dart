import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/model/video_model.dart';

class VideoController extends GetxController {
  RxList<VideoModel> videos = <VideoModel>[].obs;

  Future<void> fetchVideos( {required String courseId}) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.13:5000/videos-show?courseid=$courseId'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> videosData = jsonData['videos'];
        videos.value = videosData
            .map((video) => VideoModel.fromJson(video))
            .toList()
            .cast<VideoModel>();
            if (kDebugMode) {
              // ignore: invalid_use_of_protected_member
              print(videos.value);
            }
      } else {
        videos.clear();
        throw Exception('Failed to fetch videos: ${response.reasonPhrase}');
      }
    } catch (e) {
      videos.clear();
      if (kDebugMode) {
        print('Error fetching videos: $e');
      }
    }
  }
}

