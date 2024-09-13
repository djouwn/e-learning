import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/videos_controller.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoScreenPlayer extends StatelessWidget {
  final String courseId;
  VideoController videoController = Get.put(VideoController());

  VideoScreenPlayer({super.key,  required this.courseId}) {
    videoController.fetchVideos(courseId: courseId);
  }

  late List<VideoPlayerController> _controllers;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: GetBuilder<VideoController>(
          init: VideoController(), 
          builder: (videoController) {
            return Obx(() {
              if (videoController.videos.isEmpty) {
                return const Text('No videos found');
              } else {
             
                _controllers = videoController.videos.map((video) {
                  return VideoPlayerController.networkUrl(Uri.parse(video.videoPath));
                }).toList();
                _pageController = PageController();
                return PageView.builder(
                  controller: _pageController,
                  itemCount: videoController.videos.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: VideoPlayer(_controllers[index]),
                    );
                  },
                );
              }
            });
          },
        ),
      ),
    );
  }
}
