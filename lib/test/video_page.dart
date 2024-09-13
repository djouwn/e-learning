import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/videos_controller.dart';
import 'package:learnfast/test/quiz_show.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class VideoScreen extends StatelessWidget {
  
  final String courseId;
  VideoController videoController = Get.put(VideoController());

  VideoScreen({super.key, required this.courseId}) {
    videoController.fetchVideos(courseId: courseId);
  }

  late List<YoutubePlayerController> _controllers;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List'),
      ),
      body: Center(
        child: GetBuilder<VideoController>(
          init: VideoController(),
          builder: (videoController) {
            return Obx(() {
              if (videoController.videos.isEmpty) {
                return const Text('No videos found');
              } else {
                _controllers = videoController.videos.map((video) {
                  final videoId = YoutubePlayer.convertUrlToId(video.videoPath) ?? '';
                  return YoutubePlayerController(
                    initialVideoId: videoId.isNotEmpty ? videoId : '',
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  );
                }).toList();
                _pageController = PageController();
                return PageView.builder(
                  controller: _pageController,
                  itemCount: videoController.videos.length + 1, // Add 1 for the quiz page
                  itemBuilder: (context, index) {
                    if (index < videoController.videos.length) {
                      // Return video pages
                      return Center(
                        child: YoutubePlayer(
                          controller: _controllers[index],
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                          onReady: () {
                            if (kDebugMode) {
                              print('Player is ready.');
                            }
                          },
                        ),
                      );
                    } else {
                      // Return quiz page at the last index
                      return ElevatedButton(onPressed: (){
Get.to(QuizApplication(courseId: courseId,));
                      }, child: const Text("go to quizzes"));
                    }
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


